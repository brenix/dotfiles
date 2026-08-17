# ~/.config/shell.local.d/*.sh holds plain `export KEY=value` lines shared with
# zsh. Fish cannot source POSIX syntax, so parse it. Fish-only local config
# stays in ~/.config/fish/conf.local.d/*.fish.
if status is-interactive
    for file in ~/.config/shell.local.d/*.sh
        while read -l line
            set -l entry (string trim -- $line)
            string match -qr '^(export +)?[A-Za-z_][A-Za-z0-9_]*=' -- $entry
            or continue

            set entry (string replace -r '^export +' '' -- $entry)
            set -l key (string split -m1 '=' -- $entry)[1]
            set -l value (string split -m1 '=' -- $entry)[2]
            set value (string replace -r '^\'(.*)\'$' '$1' -- $value)
            set value (string replace -r '^"(.*)"$' '$1' -- $value)

            set -gx $key $value
        end <$file
    end
end
