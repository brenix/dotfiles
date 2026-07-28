#!/usr/bin/env python3
"""
colors_to_json.py

Convert a wide variety of terminal/theme color-definition files (Xresources,
kitty.conf, alacritty yaml/toml, wezterm lua-ish key/value blocks, plain
key=value files, partial JSON, etc.) into a standardized JSON schema:

{
  "colors": {
    "color0": "#332d38", ... "color15": "#ffffff"
  },
  "special": {
    "background": "#000000",
    "foreground": "#ffffff",
    "cursor": "#ffffff"
  }
}

Strategy
--------
Rather than writing a dedicated parser per format, this script scans the
input line-by-line (and section-aware for nested yaml/toml) looking for:

  1. Explicit "colorN" tokens (color0..color15, color_0, Color15, etc.)
     -> these map straight to colorN.

  2. Named ANSI colors (black, red, green, yellow, blue, magenta, cyan,
     white) optionally prefixed with "bright" (brightRed, bright_red,
     bright-red) -> mapped to the correct 0-7 / 8-15 index. If not
     explicitly prefixed, we track the current section header
     ([colors.normal] / [colors.bright] / "normal:" / "bright:") to
     decide which half of the palette applies.

  3. background / foreground / cursor keywords (with common aliases like
     bg, fg, cursorColor, cursor_text, background_color, ...) -> special.

  4. Already-valid JSON containing "colors"/"special" keys -> merged
     directly (handles feeding in a file that's already in a similar
     shape, or nested under different key names).

Any 3 or 6 digit hex color adjacent (same line, or same key=value pair)
to one of the above tokens is captured. Whichever match happens last for
a given key wins, so put your "real" file through as-is; only one
value assignment is expected per key in practice.

Usage
-----
    python3 colors_to_json.py input_theme_file [-o output.json]
    cat some_theme.conf | python3 colors_to_json.py -

Notes
-----
- If color8..color15 are never found but color0..color7 are, they are
  copied from color0..color7 (many themes reuse normal as bright).
- If background/foreground/cursor are missing, sensible fallbacks are
  used (background -> color0, foreground -> color15/color7, cursor ->
  foreground).
"""

import argparse
import json
import re
import sys

HEX_RE = r"#?[0-9a-fA-F]{6}\b|#?[0-9a-fA-F]{3}\b"

NAMED_COLORS = {
    "black": 0, "red": 1, "green": 2, "yellow": 3,
    "blue": 4, "magenta": 5, "cyan": 6, "white": 7,
}

SPECIAL_ALIASES = {
    "background": "background", "bg": "background",
    "backgroundcolor": "background", "background_color": "background",
    "foreground": "foreground", "fg": "foreground",
    "foregroundcolor": "foreground", "foreground_color": "foreground",
    "text": "foreground",
    "cursor": "cursor", "cursorcolor": "cursor", "cursor_color": "cursor",
    "cursor_background": "cursor",
    # NOTE: cursor-text / cursor_text (ghostty, alacritty "text" under
    # [colors.cursor]) is the color of text *underneath* the cursor block,
    # not the cursor color itself - intentionally NOT aliased here so it
    # doesn't clobber the real cursor color.
}

COLOR_N_RE = re.compile(r"\bcolor[_\-]?(\d{1,2})\b", re.IGNORECASE)
# ghostty-style:  palette = 3=#c17a6a   (also tolerate "palette=3 = #hex")
PALETTE_RE = re.compile(
    r"\bpalette\b\s*=\s*(\d{1,2})\s*=\s*(" + HEX_RE + r")", re.IGNORECASE
)

# key token at start of a "key <sep> value" line, e.g.  black: "#111"
KEY_RE = re.compile(r"""^[\s\-*.]*['"]?([A-Za-z_][A-Za-z0-9_\-]*)['"]?\s*[:=]""")

SECTION_RE = re.compile(r"""^\s*\[?[\"']?colors?\.?(normal|bright|primary|cursor)[\"']?\]?\s*:?\s*$""",
                         re.IGNORECASE)
# also bare "normal:" / "bright:" headers (yaml nesting)
BARE_SECTION_RE = re.compile(r"^\s*(normal|bright|primary|cursor)\s*:\s*$", re.IGNORECASE)


def normalize_hex(h: str) -> str:
    h = h.strip()
    if not h.startswith("#"):
        h = "#" + h
    h = h.lower()
    if len(h) == 4:  # #abc -> #aabbcc
        h = "#" + "".join(c * 2 for c in h[1:])
    return h


def find_hex_on_line(line: str):
    m = re.search(HEX_RE, line)
    return normalize_hex(m.group(0)) if m else None


def parse_generic(text: str):
    colors = {}
    special = {}
    section = None  # "normal" | "bright" | None

    for raw_line in text.splitlines():
        line = raw_line.strip()
        if not line or line.startswith("//") or line.startswith("#!"):
            continue

        # Track section headers for nested yaml/toml styles
        sec_match = SECTION_RE.match(line) or BARE_SECTION_RE.match(line)
        if sec_match:
            token = sec_match.group(1).lower()
            if token in ("normal", "bright", "primary", "cursor"):
                section = token
            continue

        # ghostty-style "palette = N=#hex" lines (must be checked before
        # generic hex/key extraction since the line has two '=' signs and
        # no literal "color" word for COLOR_N_RE to latch onto)
        pmatch = PALETTE_RE.search(line)
        if pmatch:
            idx = int(pmatch.group(1))
            if 0 <= idx <= 15:
                colors[f"color{idx}"] = normalize_hex(pmatch.group(2))
            continue

        hexval = find_hex_on_line(line)
        if not hexval:
            continue

        # 1. explicit colorN
        cmatch = COLOR_N_RE.search(line)
        if cmatch:
            idx = int(cmatch.group(1))
            if 0 <= idx <= 15:
                colors[f"color{idx}"] = hexval
            continue

        # extract the key token to test against named colors / specials
        kmatch = KEY_RE.match(raw_line)
        key = kmatch.group(1).lower() if kmatch else None
        # also allow space-separated "key value" (kitty style: 'color0 #111'
        # already handled above; 'background #111' handled here)
        if key is None:
            parts = line.split(None, 1)
            if len(parts) == 2 and re.search(HEX_RE, parts[1]):
                key = parts[0].strip().strip('"\'').lower()

        if key is None:
            continue

        key_clean = key.replace("-", "_")

        # bright-prefixed named colors, e.g. brightred / bright_red
        bright_prefixed = None
        for prefix in ("bright_", "bright"):
            if key_clean.startswith(prefix):
                candidate = key_clean[len(prefix):]
                if candidate in NAMED_COLORS:
                    bright_prefixed = candidate
                    break

        if bright_prefixed:
            colors[f"color{NAMED_COLORS[bright_prefixed] + 8}"] = hexval
            continue

        if key_clean in NAMED_COLORS:
            base_idx = NAMED_COLORS[key_clean]
            offset = 8 if section == "bright" else 0
            colors[f"color{base_idx + offset}"] = hexval
            continue

        if key_clean in SPECIAL_ALIASES:
            # Inside an alacritty-style [colors.cursor] section, "text" is
            # the cursor's own text color, not the global foreground -
            # skip it so it doesn't clobber the real foreground value.
            if section == "cursor" and key_clean == "text":
                continue
            special[SPECIAL_ALIASES[key_clean]] = hexval
            continue

    return colors, special


def try_parse_json(text: str):
    """If the input is already JSON-ish, pull matching keys out directly."""
    try:
        data = json.loads(text)
    except (json.JSONDecodeError, ValueError):
        return None, None

    colors = {}
    special = {}

    def walk(obj):
        if isinstance(obj, dict):
            for k, v in obj.items():
                kl = str(k).lower().replace("-", "_")
                if isinstance(v, str) and re.fullmatch(HEX_RE, v):
                    hexval = normalize_hex(v)
                    cmatch = COLOR_N_RE.fullmatch(kl)
                    if cmatch:
                        idx = int(cmatch.group(1))
                        if 0 <= idx <= 15:
                            colors[f"color{idx}"] = hexval
                        continue
                    if kl in SPECIAL_ALIASES:
                        special[SPECIAL_ALIASES[kl]] = hexval
                        continue
                    if kl in NAMED_COLORS:
                        colors[f"color{NAMED_COLORS[kl]}"] = hexval
                        continue
                walk(v)
        elif isinstance(obj, list):
            for item in obj:
                walk(item)

    walk(data)
    return colors, special


def fill_defaults(colors: dict, special: dict):
    # mirror normal -> bright if bright missing entirely
    if all(f"color{i}" not in colors for i in range(8, 16)) and \
       any(f"color{i}" in colors for i in range(0, 8)):
        for i in range(8):
            if f"color{i}" in colors:
                colors[f"color{i+8}"] = colors[f"color{i}"]

    for i in range(16):
        colors.setdefault(f"color{i}", "#000000" if i == 0 else "#ffffff")

    special.setdefault("background", colors.get("color0", "#000000"))
    special.setdefault("foreground", colors.get("color15", colors.get("color7", "#ffffff")))
    special.setdefault("cursor", special["foreground"])

    return colors, special


def build_output(colors: dict, special: dict):
    ordered_colors = {f"color{i}": colors[f"color{i}"] for i in range(16)}
    ordered_special = {
        "background": special["background"],
        "foreground": special["foreground"],
        "cursor": special["cursor"],
    }
    return {"colors": ordered_colors, "special": ordered_special}


def convert(text: str):
    colors, special = try_parse_json(text)
    if not colors and not special:
        colors, special = {}, {}

    g_colors, g_special = parse_generic(text)
    # generic parse fills in anything the JSON pass missed
    for k, v in g_colors.items():
        colors.setdefault(k, v)
    for k, v in g_special.items():
        special.setdefault(k, v)

    colors, special = fill_defaults(colors, special)
    return build_output(colors, special)


def main():
    ap = argparse.ArgumentParser(description=__doc__,
                                  formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("input", help="Path to theme/config file, or '-' for stdin")
    ap.add_argument("-o", "--output", help="Path to write JSON (default: stdout)")
    args = ap.parse_args()

    if args.input == "-":
        text = sys.stdin.read()
    else:
        with open(args.input, "r", encoding="utf-8", errors="replace") as f:
            text = f.read()

    result = convert(text)
    out = json.dumps(result, indent=2)

    if args.output:
        with open(args.output, "w", encoding="utf-8") as f:
            f.write(out + "\n")
        print(f"Wrote {args.output}")
    else:
        print(out)


if __name__ == "__main__":
    main()
