if application "Google Chrome" is running then
	tell application "Google Chrome"
		activate
	end tell
else
	do shell script "open -a /Applications/Google\\ Chrome.app --args \\
--allow-insecure-localhost \\
--disable-breakpad \\
--disable-device-discovery \\
--disable-logging \\
--disable-smooth-scrolling \\
--disable-speech-input \\
--enable-fast-unload \\
--enable-gpu-rasterization \\
--enable-lcd-text \\
--enable-oop-rasterization \\
--enable-precache \\
--enable-quic \\
--enable-stale-while-revalidate \\
--enable-surfaces-for-videos \\
--enable-tcp-fastopen \\
--enable-zero-copy \\
--force-gpu-rasterization \\
--ignore-gpu-blacklist \\
--no-default-browser-check \\
--origin-to-force-quic-on=accounts.google.com:443 \\
--origin-to-force-quic-on=apis.google.com:443 \\
--origin-to-force-quic-on=notifications.google.com:443 \\
--origin-to-force-quic-on=www.google.com:443 \\
--reduced-referrer-granularity \\
--use-simple-cache-backend \\
--use-skia-deferred-display-list \\
--wm-window-animations-disabled"
end if
