/******************************************************************************
 * STARTUP & HOMEPAGE
 ******************************************************************************/

// Suppress the about:config warning page. [default: true]
user_pref("browser.aboutConfig.showWarning", false);

// Skip the default browser check on startup. [default: true]
user_pref("browser.shell.checkDefaultBrowser", false);

// Skip default browser check on very first run. [default: false]
user_pref("browser.shell.skipDefaultBrowserCheckOnFirstRun", true);

// Startup behavior: 0=blank, 1=home, 2=last visited, 3=resume session. [default: 1]
user_pref("browser.startup.page", 0);

// Home/new-window page URL. [default: "about:home"]
user_pref("browser.startup.homepage", "about:blank");

// Disable Activity Stream on new tab page (shows blank page instead). [default: true]
user_pref("browser.newtabpage.enabled", false);

// Suppress "What's New" migration page after updates. [default: ""]
user_pref("browser.startup.homepage_override.mstone", "ignore");

// Disable the first-run welcome page. [default: true]
user_pref("browser.aboutwelcome.enabled", false);

// Clear welcome/override startup URLs. [default: various]
user_pref("startup.homepage_welcome_url", "");
user_pref("startup.homepage_welcome_url.additional", "");
user_pref("startup.homepage_override_url", "");

// Disable "What's New" Nimbus notification. [default: false]
user_pref("startup.homepage_override_nimbus_disable_wnp", true);

// Bypass Terms of Use notification (future-dated to suppress). [default: ""]
user_pref("datareporting.policy.dataSubmissionPolicyAcceptedVersion", 999);
user_pref("datareporting.policy.dataSubmissionPolicyBypassNotification", true);
user_pref("datareporting.policy.dataSubmissionPolicyNotifiedTime", "32503679999000");
user_pref("termsofuse.acceptedDate", "32503679999000");
user_pref("termsofuse.acceptedVersion", 999);
user_pref("termsofuse.bypassNotification", true);

/******************************************************************************
 * UI & APPEARANCE
 ******************************************************************************/

// Show the compact density option in the Customize panel. [default: false]
user_pref("browser.compactmode.show", true);

// UI density: 0=normal, 1=compact, 2=touch. [default: 0]
user_pref("browser.uidensity", 1);

// Show tabs inside the title bar. [default: 0]
user_pref("browser.tabs.inTitlebar", 1);

// Default western font family. [default: "serif"]
user_pref("font.default.x-western", "sans-serif");

// Enable custom userChrome.css / userContent.css. [default: false]
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

// Force content color scheme: 0=dark, 1=light, 2=follow system. [default: 2]
user_pref("layout.css.prefers-color-scheme.content-override", 1);

// Use the OS/theme accent color for browser chrome elements. [default: false]
user_pref("widget.non-native-theme.use-theme-accent", true);

// Disable separate private window task bar entry (Windows). [default: true]
user_pref("browser.privateWindowSeparation.enabled", false);

// Remove fullscreen transition animation. [default: "200 200"]
user_pref("full-screen-api.transition-duration.enter", "0 0");
user_pref("full-screen-api.transition-duration.leave", "0 0");

// Disable fullscreen warning overlay delay and timeout. [default: 500 / 3000]
user_pref("full-screen-api.warning.delay", 0);
user_pref("full-screen-api.warning.timeout", 0);

// Enable the Firefox multi-profile UI. [default: false]
user_pref("browser.profiles.enabled", true);

// Show "View Image Info" in the right-click context menu. [default: false]
user_pref("browser.menu.showViewImageInfo", true);

// Highlight all find-bar matches by default. [default: false]
user_pref("findbar.highlightAll", true);

// Don't eat the space after a word when double-click selecting. [default: true]
user_pref("layout.word_select.eat_space_to_next_word", false);

// Suppress close/quit warning dialogs. [default: varies]
user_pref("browser.tabs.warnOnClose", false);
user_pref("browser.tabs.warnOnCloseOtherTabs", false);
user_pref("browser.tabs.warnOnOpen", false);
user_pref("browser.warnOnQuit", false);
user_pref("browser.warnOnQuitShortcut", false);

// Enable "context properties" for content (e.g. contextual menus). [default: false]
user_pref("svc.context-properties.content.enabled", true);

// --- GNOME Theme (firefox-gnome-theme) ---
user_pref("gnomeTheme.activeTabContrast", true);
user_pref("gnomeTheme.hideSingleTab", false);
user_pref("gnomeTheme.hideWebrtcIndicator", true);
user_pref("gnomeTheme.spinner", true);
user_pref("gnomeTheme.systemIcons", true);

// --- Sidebar ---
// Disable sidebar open/close animation. [default: true]
user_pref("sidebar.animation.enabled", false);
// Enable the revamped sidebar UI. [default: false]
user_pref("sidebar.revamp", true);
// Disable vertical tab layout inside the sidebar. [default: false]
user_pref("sidebar.verticalTabs", false);
// Keep the sidebar always visible. [default: "hide-sidebar"]
user_pref("sidebar.visibility", "always-show");

/******************************************************************************
 * PERFORMANCE & CACHING
 ******************************************************************************/

// Disable disk cache; use memory cache only. [default: true]
user_pref("browser.cache.disk.enable", false);

// Max I/O lag on shutdown before cache is dropped (seconds). [default: 2]
user_pref("browser.cache.max_shutdown_io_lag", 1);

// Max size of a single memory cache entry (KB). [default: 5120]
user_pref("browser.cache.memory.max_entry_size", 8192);

// Force media cache to memory in Private Browsing. [default: false]
user_pref("browser.privatebrowsing.forceMediaMemoryCache", true);

// Max size of the media memory cache (KB). [default: 8192]
user_pref("media.memory_cache_max_size", 65536);

// How many seconds ahead to cache streaming media. [default: 60]
user_pref("media.cache_readahead_limit", 7200);

// Resume threshold for media cache (seconds). [default: 30]
user_pref("media.cache_resume_threshold", 3600);

// GPU canvas cache item count. [default: 2048]
user_pref("gfx.canvas.accelerated.cache-items", 4096);

// GPU canvas cache size (MB). [default: 256]
user_pref("gfx.canvas.accelerated.cache-size", 512);

// Skia font cache size (MB). [default: 10]
user_pref("gfx.content.skia-font-cache-size", 20);

// Max generic font substitutions for fontconfig. [default: 3]
user_pref("gfx.font_rendering.fontconfig.max_generic_substitutions", 127);

// Word-shaping cache character limit. [default: 32]
user_pref("gfx.font_rendering.wordcache.charlimit", 64);

// Word-shaping cache max entries. [default: 10000]
user_pref("gfx.font_rendering.wordcache.maxentries", 20000);

// Enable WebRender layer compositor for smoother compositing. [default: false]
user_pref("gfx.webrender.layer-compositor", true);

// Enable all WebRender features including the compositor. [default: false]
user_pref("gfx.webrender.all", true);

// Force GPU layer acceleration. [default: false]
user_pref("layers.acceleration.force-enabled", true);

// Image decode chunk size (bytes) — larger = fewer decoding pauses. [default: 4096]
user_pref("image.mem.decode_bytes_at_a_time", 32768);

// Delay before first paint (ms) — small delay improves layout completeness. [default: 5]
user_pref("nglayout.initialpaint.delay", 30);

// First paint delay in out-of-process iframes (ms). [default: 5]
user_pref("nglayout.initialpaint.delay_in_oopif", 30);

// Session save interval (ms) — large value reduces disk I/O. [default: 15000]
user_pref("browser.sessionstore.interval", 1000000);

// Enable Fission site isolation. [default: true]
user_pref("fission.autostart", true);

// GPU sandbox level on Linux. [default: 0]
user_pref("security.sandbox.gpu.level", 1);

/******************************************************************************
 * NETWORK & CONNECTIVITY
 ******************************************************************************/

// Network read buffer count. [default: 32]
user_pref("network.buffer.cache.count", 128);

// Network read buffer size (bytes). [default: 32768]
user_pref("network.buffer.cache.size", 262144);

// Disable IPv6 DNS lookups (useful with VPN or when IPv6 is unavailable). [default: false]
user_pref("network.dns.disableIPv6", true);

// Allow DNS prefetch on HTTP links (performance). [default: false]
user_pref("network.dns.disablePrefetch", false);

// Allow DNS prefetch on HTTPS links (performance). [default: true]
user_pref("network.dns.disablePrefetchFromHTTPS", false);

// Skip CNAME check when validating HTTPS DNS RR records. [default: true]
user_pref("network.dns.https_rr.check_record_with_cname", false);

// Max any-priority DNS resolver threads. [default: 16]
user_pref("network.dns.max_any_priority_threads", 32);

// Max high-priority DNS resolver threads. [default: 8]
user_pref("network.dns.max_high_priority_threads", 24);

// DNS resolver shutdown timeout (ms). [default: 2000]
user_pref("network.dns.resolver_shutdown_timeout_ms", 1000);

// DNS cache entry limit. [default: 400]
user_pref("network.dnsCacheEntries", 20000);

// Allow HTTP/3 even when third-party root CAs are installed. [default: true]
user_pref("network.http.http3.disable_when_third_party_roots_found", false);

// Enable HTTP/3 (QUIC). [default: true]
user_pref("network.http.http3.enabled", true);

// Enable HTTP/3 version negotiation. [default: true]
user_pref("network.http.http3.version_negotiation.enabled", true);

// Max total concurrent HTTP connections. [default: 900]
user_pref("network.http.max-connections", 256);

// Max persistent connections per server. [default: 6]
user_pref("network.http.max-persistent-connections-per-server", 12);

// Max urgent connections per host at startup. [default: 3]
user_pref("network.http.max-urgent-start-excessive-connections-per-host", 5);

// Disable HTTP request pacing to allow burst requests. [default: true]
user_pref("network.http.pacing.requests.enabled", false);

// Enable link prefetching (rel=prefetch). [default: true]
user_pref("network.prefetch-next", true);

// Enable the network predictor for preconnect and prefetch. [default: true]
user_pref("network.predictor.enabled", true);

// Allow the predictor to prefetch (not just preconnect). [default: false]
user_pref("network.predictor.enable-prefetch", true);

// Allow local dev proxies to intercept localhost. [default: false]
user_pref("network.proxy.allow_hijacking_localhost", true);

// SSL session token cache capacity. [default: 2048]
user_pref("network.ssl_tokens_cache_capacity", 10240);

// TCP keepalive idle time (seconds). [default: 600]
user_pref("network.tcp.keepalive.idle_time", 300);

// Limit speculative connections opened on link hover to 0 (disable). [default: 6]
user_pref("network.http.speculative-parallel-limit", 0);

// Disable speculative connections from the location bar. [default: true]
user_pref("browser.urlbar.speculativeConnect.enabled", false);

// Disable speculative connections from bookmarks/history hover. [default: true]
user_pref("browser.places.speculativeConnect.enabled", false);

// Cross-origin referer trimming: 0=full URI, 1=+path, 2=origin only. [default: 0]
user_pref("network.http.referer.XOriginTrimmingPolicy", 2);

// Show Punycode for IDNs to prevent homograph spoofing. [default: false]
user_pref("network.IDN_show_punycode", true);

// Enable post-quantum Kyber key exchange for HTTP/3. [default: false]
user_pref("network.http.http3.enable_kyber", true);

// SameSite=Lax by default for cookies (CSRF protection). [default: true]
user_pref("network.cookie.sameSite.laxByDefault", true);

// Require Secure attribute for SameSite=None cookies. [default: true]
user_pref("network.cookie.sameSite.noneRequiresSecure", true);

// Treat http vs https as different origins for SameSite. [default: false]
user_pref("network.cookie.sameSite.schemeful", true);

// Reduce referer sent to known trackers to origin only. [default: 1]
user_pref("network.http.referer.defaultPolicy.trackers", 1);
user_pref("network.http.referer.defaultPolicy.trackers.pbmode", 1);

// Route DNS through SOCKS proxy when one is active. [default: false]
user_pref("network.proxy.socks_remote_dns", true);

// Disable UNC paths (potential proxy bypass vector). [default: false]
user_pref("network.file.disable_unc_paths", true);

// Disable GIO protocols (potential proxy bypass on Linux). [default: ""]
user_pref("network.gio.supported-protocols", "");

// Disable captive portal detection (prevents background HTTP requests). [default: true]
user_pref("network.captive-portal-service.enabled", false);
user_pref("captivedetect.canonicalURL", "");

// Disable network connectivity background checks. [default: true]
user_pref("network.connectivity-service.enabled", false);

// Disable offline status management (avoids unnecessary network checks). [default: true]
user_pref("network.manage-offline-status", false);

/******************************************************************************
 * DNS & PROXY
 ******************************************************************************/

// DoH mode: 0=off, 1=with fallback, 2=on, 3=strict, 5=system resolver only. [default: 0]
// Set to 5 to use system/OS resolver exclusively (e.g. local Pi-hole, VPN DNS).
user_pref("network.trr.mode", 5);

// Clear DoH confirmation NS (unused when mode=5). [default: URL]
user_pref("network.trr.confirmationNS", "");

/******************************************************************************
 * SECURITY & TLS/HTTPS
 ******************************************************************************/

// OCSP certificate validation: 0=disabled, 1=enabled, 2=EV only.
// Disabled here in favor of CRLite (more privacy-preserving). [default: 1]
user_pref("security.OCSP.enabled", 0);

// CRLite enforcement: 0=off, 1=telemetry only, 2=enforce revoked+valid, 3=enforce valid. [default: 1]
user_pref("security.pki.crlite_mode", 2);

// Fetch CRLite filter updates from remote settings. [default: true FF137+]
user_pref("security.remote_settings.crlite_filters.enabled", true);

// Flag broken TLS negotiation in the padlock UI. [default: false]
user_pref("security.ssl.treat_unsafe_negotiation_as_broken", true);

// Require RFC-compliant safe TLS negotiation (may reject old servers). [default: false]
user_pref("security.ssl.require_safe_negotiation", true);

// Show advanced cert info on insecure connection warning pages. [default: false]
user_pref("browser.xul.error_pages.expert_bad_cert", true);

// Disable TLS 1.3 0-RTT to prevent replay attacks. [default: true]
user_pref("security.tls.enable_0rtt_data", false);

// Enable post-quantum Kyber key exchange for TLS. [default: false]
user_pref("security.tls.enable_kyber", true);

// Enforce no TLS 1.0/1.1 downgrade. [default: false]
user_pref("security.tls.version.enable-deprecated", false);

// HTTPS-only mode in all windows. [default: false]
user_pref("dom.security.https_only_mode", false);

// Show helpful suggestions on HTTPS-only error pages. [default: false]
user_pref("dom.security.https_only_mode_error_page_user_suggestions", true);

// Disable HTTP background requests in HTTPS-only mode. [default: true]
user_pref("dom.security.https_only_mode_send_http_background_request", false);

// Strict cert pinning (HPKP): 0=off, 1=allow user MitM (e.g. AV), 2=strict. [default: 1]
user_pref("security.cert_pinning.enforcement_level", 0);

// Disable MitM detection ping to Mozilla. [default: true]
user_pref("security.certerrors.mitm.priming.enabled", false);
user_pref("security.certerrors.mitm.priming.endpoint", "");
user_pref("security.pki.mitm_canary_issuer", "");
user_pref("security.pki.mitm_canary_issuer.enabled", false);

// Disable OCSP stapling (stapling leaks fetch timing; CRLite preferred). [default: true]
user_pref("security.ssl.enable_ocsp_stapling", false);

// Add a security delay to install/save dialogs (ms). [default: 1000]
user_pref("security.dialog_enable_delay", 1000);

// Disable PDF.js JavaScript execution (JS embedded in PDFs). [default: true]
user_pref("pdfjs.enableScripting", false);

// Disable navigator.sendBeacon (analytics beacons on page unload). [default: true]
user_pref("beacon.enabled", false);

// Prevent scripts from moving or resizing windows. [default: false]
user_pref("dom.disable_window_move_resize", true);

// Disable CSP violation reporting endpoint. [default: true FF140+]
user_pref("security.csp.reporting.enabled", false);

// Filter javascript: URIs from URL bar history. [default: false]
user_pref("browser.urlbar.filter.javascript", true);

// Disable content analysis by enterprise DLP agents. [default: false FF121+]
user_pref("browser.contentanalysis.enabled", false);
user_pref("browser.contentanalysis.default_result", 0);

// Disable remote debugging (DevTools). [default: false]
user_pref("devtools.debugger.remote-enabled", false);

/******************************************************************************
 * PRIVACY & TRACKING PROTECTION
 ******************************************************************************/

// Use ETP Strict mode (blocks more trackers, fingerprinters, cryptominers). [default: "standard", optional: "strict"]
user_pref("browser.contentblocking.category", "standard");

// Enable Global Privacy Control (GPC) signal to sites. [default: false]
user_pref("privacy.globalprivacycontrol.enabled", true);
user_pref("privacy.globalprivacycontrol.functionality.enabled", true);
user_pref("privacy.globalprivacycontrol.pbmode.enabled", true);

// Isolate resources injected by content scripts to prevent tracking. [default: false FF139+]
user_pref("privacy.antitracking.isolateContentScriptResources", true);

// Enable container tabs and their UI. [default: false]
user_pref("privacy.userContext.enabled", true);
user_pref("privacy.userContext.ui.enabled", true);

// Isolate storage and permissions per container. [default: false]
user_pref("permissions.isolateBy.userContext", true);

// Strip tracking query parameters from URLs (e.g. fbclid, gclid). [default: false FF101+]
user_pref("privacy.query_stripping.enabled", true);
user_pref("privacy.query_stripping.strip_list", "__hsfp __hssc __hstc __s _bhlid _branch_match_id _branch_referrer _gl _hsenc _kx _openstat at_recipient_id at_recipient_list bbeml bsft_clkid bsft_uid dclid et_rid fb_action_ids fb_comment_id fbclid gclid guce_referrer guce_referrer_sig hsCtaTracking irclickid mc_eid ml_subscriber ml_subscriber_hash msclkid mtm_cid oft_c oft_ck oft_d oft_id oft_ids oft_k oft_lk oft_sk oly_anon_id oly_enc_id pk_cid rb_clickid s_cid sc_customer sc_eh sc_uid sms_click sms_source sms_uph srsltid ss_email_id syclid ttclid twclid unicorn_click_id vero_conv vero_id vgo_ee wbraid wickedid yclid ymclid ysclid");

// Enable fingerprinting protection (FPP). [default: false FF114+]
user_pref("privacy.fingerprintingProtection", true);

// Enable FPP in Private Browsing. [default: true]
user_pref("privacy.fingerprintingProtection.pbmode", true);

// Enable cookie banner blocking (auto-reject where possible). [default: false]
user_pref("cookiebanners.bannerClicking.enabled", true);
user_pref("cookiebanners.cookieInjector.enabled", true);
// Mode: 0=off, 1=reject-only, 2=accept if no reject rule. [default: 0]
user_pref("cookiebanners.service.mode", 1);
user_pref("cookiebanners.service.mode.privateBrowsing", 1);
user_pref("cookiebanners.service.enableGlobalRules", true);
user_pref("cookiebanners.service.enableGlobalRules.subFrames", true);
user_pref("cookiebanners.ui.desktop.enabled", true);

// Disable Do Not Track header (widely ignored; can itself be used to fingerprint). [default: false]
user_pref("privacy.donottrackheader.enabled", false);

// Disable Privacy-Preserving Attribution API (ad measurement). [default: false]
user_pref("dom.private-attribution.submission.enabled", false);

// Enable SmartBlock shims (about:compat) to repair ETP-caused breakage. [default: true]
user_pref("extensions.webcompat.enable_shims", true);

// Disable First Party Isolation (conflicts with containers and FPP). [default: false]
user_pref("privacy.firstparty.isolate", false);

// Disable push notifications (can break web-based messaging apps if needed). [default: true]
user_pref("dom.push.enabled", false);
user_pref("dom.push.connection.enabled", false);
user_pref("dom.push.serverURL", "");
user_pref("dom.push.userAgentID", "");

// --- Safe Browsing ---
// Disable only the *remote* Safe Browsing download check (still checks locally). [default: true]
user_pref("browser.safebrowsing.downloads.remote.enabled", false);
// The settings below fully disable malware/phishing protection and are NOT recommended.
// Uncomment only if you have an alternative solution (e.g. DNS-based blocking).
// user_pref("browser.safebrowsing.malware.enabled", false);
// user_pref("browser.safebrowsing.phishing.enabled", false);
// user_pref("browser.safebrowsing.passwords.enabled", false);
// user_pref("browser.safebrowsing.downloads.enabled", false);
// user_pref("browser.safebrowsing.downloads.remote.block_potentially_unwanted", false);
// user_pref("browser.safebrowsing.downloads.remote.block_uncommon", false);
// user_pref("browser.safebrowsing.downloads.remote.block_dangerous", false);
// user_pref("browser.safebrowsing.downloads.remote.block_dangerous_host", false);
// user_pref("browser.safebrowsing.provider.google.updateURL", "");
// user_pref("browser.safebrowsing.provider.google.gethashURL", "");
// user_pref("browser.safebrowsing.provider.google4.updateURL", "");
// user_pref("browser.safebrowsing.provider.google4.gethashURL", "");
// user_pref("browser.safebrowsing.provider.google.reportURL", "");
// user_pref("browser.safebrowsing.provider.google4.reportURL", "");
// user_pref("browser.safebrowsing.provider.google4.dataSharing.enabled", false);
// user_pref("browser.safebrowsing.provider.google4.dataSharingURL", "");
// user_pref("browser.safebrowsing.provider.mozilla.gethashURL", "");
// user_pref("browser.safebrowsing.provider.mozilla.updateURL", "");
// user_pref("browser.safebrowsing.blockedURIs.enabled", false);

/******************************************************************************
 * FINGERPRINTING
 ******************************************************************************/

// Enable Resist Fingerprinting (RFP) — comprehensive spoofing of browser attributes. [default: false]
// Note: can break some sites (canvas, fonts, window size, locale, timezone).
user_pref("privacy.resistFingerprinting", true);

// Prevent sites from reading the extension list via mozAddonManager API. [default: false]
user_pref("privacy.resistFingerprinting.block_mozAddonManager", true);

// Language spoof: 0=prompt, 1=no spoof, 2=report English. [default: 0]
user_pref("privacy.spoof_english", 1);

// Max inner dimensions used when RFP rounds window sizes. [default: 1000/1000]
user_pref("privacy.window.maxInnerWidth", 1400);
user_pref("privacy.window.maxInnerHeight", 900);

// Open links targeting new windows in a tab instead. [default: 3]
user_pref("browser.link.open_newwindow", 3);

// Apply open_newwindow rule to all window.open() calls regardless of size. [default: 2]
user_pref("browser.link.open_newwindow.restriction", 0);

// Use standins for native OS accent/UI colors. [default: false]
user_pref("ui.use_standins_for_native_colors", true);

// Block web fonts (reduces fingerprint surface; may affect site appearance). [default: 1]
user_pref("browser.display.use_document_fonts", 1);

// Disable Vibration API (minimal site impact). [default: true]
user_pref("dom.vibrator.enabled", false);

// Disable Network Information API (rarely used legitimately on desktop). [default: false]
user_pref("dom.netinfo.enabled", false);

// Disable canvas capture stream (can leak canvas fingerprint). [default: true]
user_pref("canvas.capturestream.enabled", false);

// Disable offscreen canvas API. [default: false]
user_pref("gfx.offscreencanvas.enabled", false);

// Disable extended TextMetrics APIs used for font fingerprinting. [default: false]
user_pref("dom.textMetrics.actualBoundingBox.enabled", false);
user_pref("dom.textMetrics.baselines.enabled", false);
user_pref("dom.textMetrics.emHeight.enabled", false);
user_pref("dom.textMetrics.fontBoundingBox.enabled", false);

// Disable coloring of visited links (prevents history sniffing via CSS). [default: true]
user_pref("layout.css.visited_links_enabled", false);

// --- Optional Hardening (commented out — likely to break sites) ---

// Disable WebGL (breaks WebGL content: maps, 3D, games). [default: false]
// user_pref("webgl.disabled", true);
// user_pref("webgl.enable-webgl2", false);

// Disable WebGPU (breaks GPU-accelerated web apps). [default: false]
// user_pref("dom.webgpu.enabled", false);

// Disable Web Audio API (breaks sites with audio, music players, games). [default: true]
// user_pref("dom.webaudio.enabled", false);

// Disable Gamepad API (breaks browser games). [default: true]
// user_pref("dom.gamepad.enabled", false);

// Disable Touch Events API (breaks touch-based sites on touch devices). [default: 2]
// user_pref("dom.w3c_touch_events.enabled", 0);

// Disable Media Devices API (breaks camera/mic access in-browser). [default: true]
// user_pref("media.navigator.enabled", false);

// Disable Speech Synthesis API (breaks TTS-reliant sites). [default: true]
// user_pref("media.webspeech.synth.enabled", false);

// Disable Device Sensor API (breaks some mobile/PWA sites). [default: true]
// user_pref("device.sensors.enabled", false);

// Disable asm.js (may break some JS-heavy apps). [default: true]
// user_pref("javascript.options.asmjs", false);

// Disable JIT compiler — significant performance hit; breaks many sites. [default: true]
// user_pref("javascript.options.ion", false);
// user_pref("javascript.options.baselinejit", false);
// user_pref("javascript.options.wasm_baselinejit", false);

// Disable WebAssembly (breaks WASM-based apps: Figma, Google Meet, etc.). [default: true]
// user_pref("javascript.options.wasm", false);

// Disable MathML rendering (breaks math-heavy sites). [default: false]
// user_pref("mathml.disabled", true);

// Disable SVG rendering (breaks nearly all modern websites). [default: false]
// user_pref("svg.disabled", true);

// Disable Graphite font engine. [default: true]
// user_pref("gfx.font_rendering.graphite.enabled", false);

// Disable SVG OpenType fonts. [default: true]
// user_pref("gfx.font_rendering.opentype_svg.enabled", false);

/******************************************************************************
 * URL BAR & SEARCH
 ******************************************************************************/

// Disable Firefox Suggest / sponsored suggestions. [default: true]
user_pref("browser.urlbar.quicksuggest.enabled", false);
user_pref("browser.urlbar.suggest.quicksuggest.nonsponsored", false);
user_pref("browser.urlbar.suggest.quicksuggest.sponsored", false);

// Don't trim https:// from URL bar display. [default: false]
user_pref("browser.urlbar.trimURLs", false);

// Trim https:// visually but restore on interaction. [default: false FF117+]
user_pref("browser.urlbar.trimHttps", true);

// Restore full URL on user focus/interaction. [default: false]
user_pref("browser.urlbar.untrimOnUserInteraction.featureGate", true);

// Enable and expose separate default search engine for Private Windows. [default: false]
user_pref("browser.search.separatePrivateDefault", true);
user_pref("browser.search.separatePrivateDefault.ui.enabled", true);

// Disable live search suggestions (both main and URL bar). [default: true]
user_pref("browser.search.suggest.enabled", true);
user_pref("browser.urlbar.suggest.searches", true);

// Hide suggestion group labels in the URL bar dropdown. [default: true]
user_pref("browser.urlbar.groupLabels.enabled", false);

// Disable trending search suggestions. [default: true FF118+]
user_pref("browser.urlbar.trending.featureGate", false);

// Disable Merino (Mozilla server-side URL bar suggestion service). [default: true]
user_pref("browser.urlbar.merino.enabled", false);

// Disable all feature-gated contextual URL bar suggestions.
user_pref("browser.urlbar.addons.featureGate", false);
user_pref("browser.urlbar.amp.featureGate", false);      // adMarketplace FF141+
user_pref("browser.urlbar.fakespot.featureGate", false);  // FF130+
user_pref("browser.urlbar.mdn.featureGate", false);       // FF117+
user_pref("browser.urlbar.weather.featureGate", false);   // FF108+
user_pref("browser.urlbar.wikipedia.featureGate", false); // FF141+
user_pref("browser.urlbar.yelp.featureGate", false);      // FF124+
user_pref("browser.urlbar.yelpRealtime.featureGate", false);
user_pref("browser.urlbar.importantDates.featureGate", false);
user_pref("browser.urlbar.market.featureGate", false);
user_pref("browser.urlbar.clipboard.featureGate", false); // FF118+
user_pref("browser.urlbar.recentsearches.featureGate", false); // FF120+
user_pref("browser.urlbar.pocket.featureGate", false);    // FF116+

// Disable tab-to-search for installed engines. [default: true]
user_pref("browser.urlbar.suggest.engines", false);

// Disable location bar suggestion types (history, bookmarks, open tabs, etc.).
user_pref("browser.urlbar.suggest.history", true);
user_pref("browser.urlbar.suggest.bookmark", true);
user_pref("browser.urlbar.suggest.openpage", false);
user_pref("browser.urlbar.suggest.topsites", false);
user_pref("browser.urlbar.suggest.weather", false);
user_pref("browser.urlbar.suggest.fakespot", false);

// Disable URL bar autocomplete (autofill from history). [default: true]
user_pref("browser.urlbar.autoFill", false);

// Don't show the active search term in the URL bar after searching. [default: true]
user_pref("browser.urlbar.showSearchTerms.enabled", false);

// Disable GNOME shell search provider integration (Linux). [default: false]
user_pref("browser.gnome-search-provider.enabled", false);

/******************************************************************************
 * PASSWORDS & FORMS
 ******************************************************************************/

// Disable formless login capture (non-standard login forms). [default: true]
user_pref("signon.formlessCapture.enabled", false);

// Disable password capture in Private Browsing. [default: true]
user_pref("signon.privateBrowsingCapture.enabled", false);

// Limit sub-resource HTTP auth dialogs: 0=none, 1=same-origin only, 2=all. [default: 2]
user_pref("network.auth.subresource-http-auth-allow", 1);

// Don't truncate pasted text in password fields. [default: true]
user_pref("editor.truncate_user_pastes", false);

// Disable search/form history (autocomplete dropdown). [default: true]
user_pref("browser.formfill.enable", false);

// Disable Firefox's built-in password manager. [default: true]
user_pref("signon.rememberSignons", false);

// Disable the built-in password generator. [default: true]
user_pref("signon.generation.enabled", false);

// Disable breach alerts in the password manager UI. [default: true]
user_pref("signon.management.page.breach-alerts.enabled", false);
user_pref("signon.management.page.breachAlertUrl", "");

// Disable Firefox Relay email mask suggestion. [default: "available"]
user_pref("signon.firefoxRelay.feature", "disabled");

// Disable username/password autofill on page load. [default: true]
user_pref("signon.autofillForms", false);

// Primary password prompt frequency: 0=once/session, 1=always, 2=after n minutes. [default: 0]
user_pref("security.ask_for_password", 2);

// Primary password session timeout (minutes; used when ask_for_password=2). [default: 30]
user_pref("security.password_lifetime", 5);

// Disable Form Autofill for addresses and credit cards. [default: false/false]
user_pref("extensions.formautofill.addresses.enabled", false);
user_pref("extensions.formautofill.creditCards.enabled", false);

// Disable "save card/address to Firefox" checkboxes by default. [default: true]
user_pref("dom.payments.defaults.saveAddress", false);
user_pref("dom.payments.defaults.saveCreditCard", false);

/******************************************************************************
 * DOWNLOADS
 ******************************************************************************/

// Start downloads in the system temp dir (moved to final location on open). [default: false FF102+]
user_pref("browser.download.start_downloads_in_tmp_dir", true);

// Don't add downloads to the system's recent documents list. [default: true]
user_pref("browser.download.manager.addToRecentDocs", false);

// Open PDF attachments inline rather than prompting to save. [default: false]
user_pref("browser.download.open_pdf_attachments_inline", true);

// Always ask where to save (disable auto-download to default folder). [default: true]
user_pref("browser.download.useDownloadDir", false);

// Don't auto-open the downloads panel on every download. [default: true FF96+]
user_pref("browser.download.alwaysOpenPanel", false);

// Always ask how to handle new MIME types. [default: false FF101+]
user_pref("browser.download.always_ask_before_handling_new_types", true);

// Delete temp files opened with external apps on exit. [default: false]
user_pref("browser.helperApps.deleteTempFileOnExit", true);

/******************************************************************************
 * EXTENSIONS
 ******************************************************************************/

// Limit install directories to profile + application (5). [default: 15]
user_pref("extensions.enabledScopes", 5);

// Disable post-download third-party install prompt bypass. [default: true FF82+]
user_pref("extensions.postDownloadThirdPartyPrompt", false);

// Disable extension metadata cache (used for "Get more extensions" pane). [default: true]
user_pref("extensions.getAddons.cache.enabled", false);

// Disable add-on recommendation pane in about:addons (uses Google Analytics). [default: false]
user_pref("extensions.getAddons.showPane", false);

// Disable recommendations in Extensions/Themes panes. [default: true FF68+]
user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);

// Disable personalized extension discovery. [default: true]
user_pref("browser.discovery.enabled", false);
user_pref("extensions.webservice.discoverURL", "");
user_pref("extensions.recommendations.themeRecommendationUrl", "");

// Disable system add-on auto-updates. [default: true FF62+]
user_pref("extensions.systemAddon.update.enabled", false);
user_pref("extensions.systemAddon.update.url", "");

// Disable Quarantined Domains restriction on extensions. [default: true FF115+]
user_pref("extensions.quarantinedDomains.enabled", false);

// Disable Web Compatibility Reporter. [default: false FF56+]
user_pref("extensions.webcompat-reporter.enabled", false);

// Hide ML model section in extension manager. [default: false]
user_pref("extensions.ui.mlmodel.hidden", true);

// Disable the Pocket extension. [default: true FF46+]
user_pref("extensions.pocket.enabled", false);

// Disable Screenshots extension. [default: false FF55+]
user_pref("extensions.screenshots.disabled", true);

// The extension blocklist protects against known malicious add-ons — keep enabled.
// user_pref("extensions.blocklist.enabled", false);

/******************************************************************************
 * PERMISSIONS & APIs
 ******************************************************************************/

// Default permission policy: 0=always ask, 1=allow, 2=block.
user_pref("permissions.default.geo", 1);
user_pref("permissions.default.camera", 2);
user_pref("permissions.default.microphone", 2);
user_pref("permissions.default.desktop-notification", 0);
user_pref("permissions.default.xr", 2);

// Use BeaconDB instead of Google for geolocation when permission is granted. [default: Google URL]
user_pref("geo.provider.network.url", "https://beacondb.net/v1/geolocate");

// Enable/Disable geolocation API entirely. [default: true]
user_pref("geo.enabled", true);

// Disable OS-level geolocation providers.
user_pref("geo.provider.ms-windows-location", false);    // Windows
user_pref("geo.provider.use_corelocation", false);       // macOS
user_pref("geo.provider.use_gpsd", false);               // Linux
user_pref("geo.provider.geoclue.always_high_accuracy", false); // Linux
user_pref("geo.provider.use_geoclue", false);            // Linux FF102+

// Disable region auto-detection. [default: true FF78+/FF79+]
user_pref("browser.region.network.url", "");
user_pref("browser.region.update.enabled", false);

// Remove Mozilla's built-in site permissions overrides list. [default: URL string]
user_pref("permissions.manager.defaultsUrl", "");

// Remove privileged content process for Mozilla web properties. [default: true]
user_pref("browser.tabs.remote.separatePrivilegedMozillaWebContentProcess", false);
user_pref("browser.tabs.remote.separatedMozillaDomains", "");
user_pref("dom.ipc.processCount.privilegedmozilla", 0);

/******************************************************************************
 * MEDIA & WEBRTC
 ******************************************************************************/

// WebRTC is kept enabled for video conferencing. To disable, uncomment below.
// user_pref("media.peerconnection.enabled", false);

// Force WebRTC ICE through proxy when a proxy is configured. [default: false FF70+]
user_pref("media.peerconnection.ice.proxy_only_if_behind_proxy", true);

// Restrict ICE to a single network interface (reduces IP leakage). [default: false FF42+]
user_pref("media.peerconnection.ice.default_address_only", true);

// Enable post-quantum DTLS key exchange for WebRTC (Kyber). [default: false]
user_pref("media.webrtc.enable_pq_dtls", true);

// Disable GMP (Gecko Media Plugins) framework. [default: true]
user_pref("media.gmp-provider.enabled", false);
user_pref("media.gmp-manager.url", "");
user_pref("media.gmp-gmpopenh264.enabled", false);

// Disable Widevine CDM (disables DRM content: Netflix, Disney+, etc.). [default: true]
user_pref("media.gmp-widevinecdm.enabled", false);

// Disable EME/DRM entirely. [default: true]
user_pref("media.eme.enabled", false);
user_pref("browser.eme.ui.enabled", false);

/******************************************************************************
 * NEW TAB PAGE & HOME CONTENT
 ******************************************************************************/

// Clear default top sites list. [default: various URLs]
user_pref("browser.newtabpage.activity-stream.default.sites", "");

// Disable sponsored shortcuts (Firefox Suggest top sites). [default: true FF83+]
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);

// Disable Pocket/recommended stories section. [default: true]
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);

// Disable sponsored stories in feed. [default: true FF58+]
user_pref("browser.newtabpage.activity-stream.showSponsored", false);

// Disable "Support Firefox" checkboxes on new tab. [default: true FF140+]
user_pref("browser.newtabpage.activity-stream.showSponsoredCheckboxes", false);

// Disable top sites feed. [default: true]
user_pref("browser.newtabpage.activity-stream.feeds.topsites", false);

// Disable search bar on new tab page. [default: true]
user_pref("browser.newtabpage.activity-stream.showSearch", false);

// Disable weather widget on new tab page. [default: false]
user_pref("browser.newtabpage.activity-stream.showWeather", false);

// Disable all highlights section content types.
user_pref("browser.newtabpage.activity-stream.section.highlights.includePocket", false);
user_pref("browser.newtabpage.activity-stream.section.highlights.includeBookmarks", false);
user_pref("browser.newtabpage.activity-stream.section.highlights.includeDownloads", false);
user_pref("browser.newtabpage.activity-stream.section.highlights.includeVisited", false);

// Disable contile sponsored tile service and remote settings. [default: true]
user_pref("browser.topsites.contile.enabled", false);
user_pref("browser.topsites.useRemoteSetting", false);

// Disable Fakespot shopping experience. [default: false FF116+]
user_pref("browser.shopping.experience2023.enabled", false);

/******************************************************************************
 * AI & ML
 ******************************************************************************/

// Block all AI control features. [default: "enabled"]
user_pref("browser.ai.control.default", "blocked");

// Disable the Firefox ML engine entirely. [default: true]
user_pref("browser.ml.enable", false);

// Disable AI chat sidebar and all related features.
user_pref("browser.ml.chat.enabled", false);
user_pref("browser.ml.chat.menu", false);
user_pref("browser.ml.chat.shortcuts", false);
user_pref("browser.ml.chat.sidebar", false);
user_pref("browser.ml.linkPreview.enabled", false);
user_pref("browser.ml.linkPreview.supportedLocales", "null");

// Disable AI-powered smart tab grouping. [default: false]
user_pref("browser.tabs.groups.smart.enabled", false);

/******************************************************************************
 * TELEMETRY & DATA COLLECTION
 ******************************************************************************/

// Disable all data submission. [default: true]
user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.usage.uploadEnabled", false);

// Disable telemetry engine and all ping types. [default: true]
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.server", "data:,");
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("toolkit.telemetry.newProfilePing.enabled", false);
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
user_pref("toolkit.telemetry.updatePing.enabled", false);
user_pref("toolkit.telemetry.bhrPing.enabled", false);        // Background Hang Reporter FF57+
user_pref("toolkit.telemetry.firstShutdownPing.enabled", false); // FF57+

// Disable telemetry coverage sampling. [default: false]
user_pref("toolkit.telemetry.coverage.opt-out", true);
user_pref("toolkit.coverage.opt-out", true);
user_pref("toolkit.coverage.endpoint.base", "");

// Disable Activity Stream telemetry. [default: true]
user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
user_pref("browser.newtabpage.activity-stream.telemetry", false);

// Disable SERP event telemetry. [default: true]
user_pref("browser.search.serpEventTelemetry.enabled", false);

// Disable WebVTT debug logging and test events. [default: false]
user_pref("media.webvtt.debug.logging", false);
user_pref("media.webvtt.testing.events", false);

// Disable content blocking report database. [default: true]
user_pref("browser.contentblocking.database.enabled", false);

// Disable content blocking milestone celebration toasts. [default: true]
user_pref("browser.contentblocking.cfr-milestone.enabled", false);

// Disable Default Browser Agent background task (Windows). [default: true]
user_pref("default-browser-agent.enabled", false);

// Disable OHTTP relay for shopping/review checker telemetry. [default: various]
user_pref("toolkit.shopping.ohttpConfigURL", "");
user_pref("toolkit.shopping.ohttpRelayURL", "");

// Disable file integrity checker (corroborator). [default: true]
user_pref("corroborator.enabled", false);

// Disable UITour backend (prevents remote pages triggering in-browser tours). [default: true]
user_pref("browser.uitour.enabled", false);
user_pref("browser.uitour.url", "");

// Clear Mozilla feedback, support, and update notification URLs. [default: various]
user_pref("app.feedback.baseURL", "");
user_pref("app.support.baseURL", "");
user_pref("app.releaseNotesURL", "");
user_pref("app.update.url.details", "");
user_pref("app.update.url.manual", "");

// Clear default protocol handler entries (mailto, IRC). [default: various]
user_pref("gecko.handlerService.schemes.mailto.0.uriTemplate", "");
user_pref("gecko.handlerService.schemes.mailto.0.name", "");
user_pref("gecko.handlerService.schemes.mailto.1.uriTemplate", "");
user_pref("gecko.handlerService.schemes.mailto.1.name", "");
user_pref("gecko.handlerService.schemes.irc.0.uriTemplate", "");
user_pref("gecko.handlerService.schemes.irc.0.name", "");
user_pref("gecko.handlerService.schemes.ircs.0.uriTemplate", "");
user_pref("gecko.handlerService.schemes.ircs.0.name", "");
user_pref("browser.translation.engine", "");

// Disable all content blocking report URLs. [default: various]
user_pref("browser.contentblocking.reportBreakage.url", "");
user_pref("browser.contentblocking.report.cookie.url", "");
user_pref("browser.contentblocking.report.cryptominer.url", "");
user_pref("browser.contentblocking.report.fingerprinter.url", "");
user_pref("browser.contentblocking.report.lockwise.enabled", false);
user_pref("browser.contentblocking.report.lockwise.how_it_works.url", "");
user_pref("browser.contentblocking.report.manage_devices.url", "");
user_pref("browser.contentblocking.report.monitor.enabled", false);
user_pref("browser.contentblocking.report.monitor.how_it_works.url", "");
user_pref("browser.contentblocking.report.monitor.sign_in_url", "");
user_pref("browser.contentblocking.report.monitor.url", "");
user_pref("browser.contentblocking.report.proxy.enabled", false);
user_pref("browser.contentblocking.report.proxy_extension.url", "");
user_pref("browser.contentblocking.report.social.url", "");
user_pref("browser.contentblocking.report.tracker.url", "");
user_pref("browser.contentblocking.report.endpoint_url", "");
user_pref("browser.contentblocking.report.monitor.home_page_url", "");
user_pref("browser.contentblocking.report.monitor.preferences_url", "");
user_pref("browser.contentblocking.report.vpn.enabled", false);
user_pref("browser.contentblocking.report.hide_vpn_banner", true);
user_pref("browser.contentblocking.report.show_mobile_app", false);
user_pref("browser.vpn_promo.enabled", false);
user_pref("browser.promo.focus.enabled", false);

// Disabling the remote settings server breaks CRLite, ETP lists, and blocklists — keep commented out.
// user_pref("services.settings.server", "");

/******************************************************************************
 * EXPERIMENTS & CRASH REPORTS
 ******************************************************************************/

// Disable Normandy/Shield studies and experiments. [default: true]
user_pref("app.shield.optoutstudies.enabled", false);
user_pref("app.normandy.enabled", false);
user_pref("app.normandy.api_url", "");

// Disable crash report submission. [default: varies]
user_pref("breakpad.reportURL", "");
user_pref("browser.tabs.crashReporting.sendReport", false);
user_pref("browser.crashReports.unsubmittedCheck.autoSubmit2", false);

/******************************************************************************
 * SHUTDOWN & SANITIZING
 ******************************************************************************/

// Enable clearing data on shutdown. [default: false]
// user_pref("privacy.sanitize.sanitizeOnShutdown", true);

// Enable custom history/clear settings (required for granular control). [default: false]
// user_pref("privacy.history.custom", true);

// Reset Private Browsing session on PBM window close. [default: false]
user_pref("browser.privatebrowsing.resetPBM.enabled", true);

// Don't store session data for HTTP sites (extra session data). [default: 0]
// 0=everywhere, 1=unencrypted sites only, 2=nowhere.
user_pref("browser.sessionstore.privacy_level", 2);

// What to clear on shutdown — FF128+ v2 API. [default: varies]
user_pref("privacy.clearOnShutdown_v2.cache", true);
// user_pref("privacy.clearOnShutdown_v2.cookiesAndStorage", true);
user_pref("privacy.clearOnShutdown_v2.historyFormDataAndDownloads", false);
// FF136+ additions:
user_pref("privacy.clearOnShutdown_v2.browsingHistoryAndDownloads", false);
user_pref("privacy.clearOnShutdown_v2.downloads", false);
user_pref("privacy.clearOnShutdown_v2.formdata", true);

// Manual "Clear Data" items — FF128+. [default: varies]
user_pref("privacy.clearSiteData.cache", true);
user_pref("privacy.clearSiteData.cookiesAndStorage", false); // keep false until it respects "allow" exceptions
user_pref("privacy.clearSiteData.historyFormDataAndDownloads", false);
user_pref("privacy.clearSiteData.browsingHistoryAndDownloads", false);
user_pref("privacy.clearSiteData.formdata", true);

// Manual "Clear History" items — FF128+. [default: varies]
user_pref("privacy.clearHistory.cache", true);
user_pref("privacy.clearHistory.cookiesAndStorage", false);
user_pref("privacy.clearHistory.historyFormDataAndDownloads", false);
user_pref("privacy.clearHistory.browsingHistoryAndDownloads", false);
user_pref("privacy.clearHistory.formdata", true);

// Time range for manual clear: 0=everything, 1=1h, 2=2h, 3=4h, 4=today. [default: 1]
user_pref("privacy.sanitize.timeSpan", 0);

/******************************************************************************
 * UPDATES
 ******************************************************************************/

// Disable auto-installing Firefox updates (non-Windows). [default: true]
user_pref("app.update.auto", false);

// Disable update staging (downloading update in background). [default: false]
user_pref("app.update.staging.enabled", false);

// Disable extension auto-update checking and installation. [default: true]
user_pref("extensions.update.enabled", false);
user_pref("extensions.update.autoUpdateDefault", false);

// Disable search engine definition updates (OpenSearch). [default: true]
user_pref("browser.search.update", false);

/******************************************************************************
 * MISCELLANEOUS
 ******************************************************************************/

// Keep Firefox Accounts and Sync enabled. [default: true FF60+]
user_pref("identity.fxaccounts.enabled", true);

// Don't close the bookmark menu when opening a bookmark in a new tab. [default: true]
user_pref("browser.bookmarks.openInTabClosesMenu", false);

// Disable the "Import bookmarks" bar buttom
user_pref("browser.bookmarks.addedImportButton", false);

// Disable "More from Mozilla" section in Preferences. [default: true]
user_pref("browser.preferences.moreFromMozilla", false);

// Disable CFR (Contextual Feature Recommendations) notifications. [default: true FF67+]
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);

// Disable the "Reset Firefox" prompt. [default: false]
user_pref("browser.disableResetPrompt", true);

// Disable middle-click on new tab button opening clipboard URL. [default: false non-Linux]
user_pref("browser.tabs.searchclipboardfor.middleclick", false);

// Disable Firefox View tab. [default: true]
user_pref("browser.tabs.firefox-view", false);
user_pref("browser.firefox-view.virtual-list.enabled", false);

// Disable Reader View. [default: true]
user_pref("reader.parse-on-load.enabled", false);

// Disable type-ahead find (Find As You Type). [default: false]
user_pref("accessibility.typeaheadfind", false);

// Disable auto-copy on selection (Linux). [default: false]
user_pref("clipboard.autocopy", false);

// Spell check scope: 0=none, 1=multi-line only, 2=all text fields. [default: 1]
user_pref("layout.spellcheckDefault", 0);

// Disable browsing and download history. [default: true]
user_pref("places.history.enabled", false);

// Disable favicons in history and bookmarks. [default: true]
user_pref("browser.chrome.site_icons", true);
user_pref("browser.shell.shortcutFavicons", true);

// Disable Windows taskbar jump list integration (Windows). [default: true]
user_pref("toolkit.winRegisterApplicationRestart", false);

// Disable favicon in Windows shortcuts (Windows). [default: true]
user_pref("browser.shell.shortcutFavicons", false);
