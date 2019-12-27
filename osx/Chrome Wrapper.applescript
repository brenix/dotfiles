if application "Google Chrome" is running then
	tell application "Google Chrome"
		activate
	end tell
else
	do shell script "open -a /Applications/Google\\ Chrome.app --args \\
--allow-insecure-localhost \\
--disable-breakpad \\
--disable-device-discovery \\
--disable-features=TabHoverCardImages,TabHoverCards \\
--disable-logging \\
--disable-smooth-scrolling \\
--disable-speech-input \\
--enable-features=brotli-encoding,LazyFrameLoading,FontCacheScaling,NoStatePrefetch,SpeculativeResourcePrefetching,SpeculativePreconnect,ProactiveTabFreezeAndDiscard,SimplifyHttpsIndicator,EnableTLS13EarlyData,BackForwardCache,DecodeJpeg420ImagesToYUV,DecodeLossyWebPImagesToYUV,DynamicTcmallocTuning,HeavyAdIntervention,LazyImageLoading,Vulkan \\
--enable-lcd-text \\
--enable-precache \\
--enable-quic \\
--enable-stale-while-revalidate \\
--enable-tcp-fastopen \\
--ignore-gpu-blacklist \\
--no-default-browser-check \\
--origin-to-force-quic-on=accounts.google.com:443 \\
--origin-to-force-quic-on=apis.google.com:443 \\
--origin-to-force-quic-on=notifications.google.com:443 \\
--origin-to-force-quic-on=www.google.com:443 \\
--reduced-referrer-granularity \\
--use-simple-cache-backend \\
--wm-window-animations-disabled"
end if
