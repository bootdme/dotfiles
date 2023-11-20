// Set DNS over HTTPS (DoH) provider to Cloudflare
// Protects web requests from ISP monitoring
// Choose a provider you trust; disable if using PiHole or similar tools
user_pref("network.trr.uri", "https://mozilla.cloudflare-dns.com/dns-query");
user_pref("network.trr.mode", 2);

// Leave IPv6 enabled for network communication
user_pref("network.dns.disableIPv6", false);

// Re-enable search engines and suggestions in the URL bar
user_pref("keyword.enabled", true);
user_pref("browser.search.suggest.enabled", false);
user_pref("browser.urlbar.suggest.searches", false);

// Disable disk caching for improved privacy
user_pref("browser.cache.disk.enable", false);

// Enable favicons (icons in bookmarks)
user_pref("browser.shell.shortcutFavicons", true);

// Enable Mozilla Container Tabs for improved account isolation
user_pref("privacy.userContext.enabled", true);
user_pref("privacy.userContext.ui.enabled", true);

// Set strict third-party requests policy (may break some images/videos)
user_pref("network.http.referer.XOriginPolicy", 2);

// WebRTC and media-related settings
// user_pref("media.peerconnection.enabled", false);
// user_pref("media.gmp-provider.enabled", false);
// user_pref("media.gmp-widevinecdm.enabled", false);
// Autoplay settings: 0=Allow all, 1=Block non-muted media (default), 5=Block all
// user_pref("media.autoplay.default", 5);
// Autoplay blocking policy: 2=User (allow if user interacts with the site)
user_pref("media.autoplay.blocking_policy", 2);

// Use Disconnect's blocklist for strict content blocking
user_pref("browser.contentblocking.category", "strict");

// Delete cookies and site data on exit, keeping until Firefox is closed
user_pref("network.cookie.lifetimePolicy", 2);

// Clear data on shutdown
user_pref("privacy.sanitize.sanitizeOnShutdown", true);
user_pref("privacy.clearOnShutdown.cache", true);
user_pref("privacy.clearOnShutdown.downloads", true);
user_pref("privacy.clearOnShutdown.formdata", true);
user_pref("privacy.clearOnShutdown.history", true);
user_pref("privacy.clearOnShutdown.sessions", true);
user_pref("privacy.clearOnShutdown.offlineApps", false);
user_pref("privacy.clearOnShutdown.cookies", false);

// Manual wiping with the Forget button
user_pref("privacy.cpd.cache", true);
user_pref("privacy.cpd.formdata", true);
user_pref("privacy.cpd.history", true);
user_pref("privacy.cpd.sessions", true);
user_pref("privacy.cpd.offlineApps", false);
user_pref("privacy.cpd.cookies", false);

// Clear everything on shutdown and set time span to 0
user_pref("privacy.sanitize.timeSpan", 0);

// Disable browsing history (might be security theater)
user_pref("places.history.enabled", false);

// Disable Firefox password storage and Mozilla account
user_pref("signon.rememberSignons", false);
user_pref("identity.fxaccounts.enabled", false);

// Disable automatic updates
user_pref("app.update.auto", false);

// Disable sending of beacon data
user_pref("beacon.enabled", false);

// Disable offline cache
user_pref("browser.cache.offline.enable", false);

// Disable automatic submission of crash reports
user_pref("browser.crashReports.unsubmittedCheck.autoSubmit", false);
user_pref("browser.crashReports.unsubmittedCheck.autoSubmit2", false);
user_pref("browser.crashReports.unsubmittedCheck.enabled", false);

// Disable the reset prompt
user_pref("browser.disableResetPrompt", true);

// Disable preloading of new tab pages
user_pref("browser.newtab.preload", false);

// Disable Pocket integration in new tab page highlights
user_pref("browser.newtabpage.activity-stream.section.highlights.includePocket", false);

// Disable enhanced new tab page features
user_pref("browser.newtabpage.enhanced", false);

// Mark new tab page intro as shown
user_pref("browser.newtabpage.introShown", true);

// Disable Safe Browsing features
user_pref("browser.safebrowsing.appRepURL", "");
user_pref("browser.safebrowsing.blockedURIs.enabled", false);
user_pref("browser.safebrowsing.downloads.enabled", false);
user_pref("browser.safebrowsing.downloads.remote.url", "");
user_pref("browser.safebrowsing.enabled", false);
user_pref("browser.safebrowsing.malware.enabled", false);
user_pref("browser.safebrowsing.phishing.enabled", false);

// Disable self-support
user_pref("browser.selfsupport.url", "");

// Disable sending of pings
user_pref("browser.send_pings", false);

// Set session store privacy level to 0 (store cookies for all sites)
user_pref("browser.sessionstore.privacy_level", 0);

// Disable checking if Firefox is the default browser
user_pref("browser.shell.checkDefaultBrowser", false);

// Disable crash reporting for tabs
user_pref("browser.tabs.crashReporting.sendReport", false);

// Disable grouping labels in the URL bar
user_pref("browser.urlbar.groupLabels.enabled", false);

// Disable URL bar quick suggestions
user_pref("browser.urlbar.quicksuggest.enabled", false);

// Disable trimming of URLs in the URL bar
user_pref("browser.urlbar.trimURLs", false);

// Disable health report service
user_pref("datareporting.healthreport.service.enabled", false);

// Disable ambient light sensor
user_pref("device.sensors.ambientLight.enabled", false);

// Disable all sensors
user_pref("device.sensors.enabled", false);
user_pref("device.sensors.motion.enabled", false);
user_pref("device.sensors.orientation.enabled", false);
user_pref("device.sensors.proximity.enabled", false);

// Disable battery status API
user_pref("dom.battery.enabled", false);

// Disable Web Audio API
user_pref("dom.webaudio.enabled", false);

// Disable experiments
user_pref("experiments.activeExperiment", false);
user_pref("experiments.enabled", false);
user_pref("experiments.manifest.uri", "");
user_pref("experiments.supported", false);

// Clear Decentraleyes whitelist
user_pref("extensions.Decentraleyes@ThomasRientjes.whiteList", "");

// Auto-disable extensions after 14 consecutive startup failures
user_pref("extensions.autoDisableScopes", 14);

// Disable caching of installed add-ons list
user_pref("extensions.getAddons.cache.enabled", false);

// Hide the add-ons pane in the add-ons manager
user_pref("extensions.getAddons.showPane", false);

// Disable Greasemonkey statistics reporting
user_pref("extensions.greasemonkey.stats.optedin", false);
user_pref("extensions.greasemonkey.stats.url", "");

// Disable Pocket integration
user_pref("extensions.pocket.enabled", false);

// Disable Shield recipe client
user_pref("extensions.shield-recipe-client.api_url", "");
user_pref("extensions.shield-recipe-client.enabled", false);

// Disable webservice discovery
user_pref("extensions.webservice.discoverURL", "");

// Set default media autoplay behavior to block
user_pref("media.autoplay.default", 0);
user_pref("media.autoplay.enabled", true);

// Disable Encrypted Media Extensions (EME)
user_pref("media.eme.enabled", false);

// Disable Widevine CDM
user_pref("media.gmp-widevinecdm.enabled", false);

// Disable navigator API
user_pref("media.navigator.enabled", false);

// Disable WebRTC peer connection
user_pref("media.peerconnection.enabled", false);

// Disable video statistics collection
user_pref("media.video_stats.enabled", false);

// Disable experiments on the network
user_pref("network.allow-experiments", false);

// Disable captive portal detection service
user_pref("network.captive-portal-service.enabled", false);

// Block all cookies by default
user_pref("network.cookie.cookieBehavior", 1);

// Disable prefetching of DNS over HTTPS
user_pref("network.dns.disablePrefetchFromHTTPS", true);

// Spoof HTTP referer header
user_pref("network.http.referer.spoofSource", true);

// Disable link prefetching
user_pref("network.predictor.enable-prefetch", false);

// Set DNS over HTTPS mode to 5 (use TRR, but fall back to native resolver)
user_pref("network.trr.mode", 5);

// Enable Do Not Track header
user_pref("privacy.donottrackheader.enabled", true);
user_pref("privacy.donottrackheader.value", 1);

// Enable query string stripping
user_pref("privacy.query_stripping", true);

// Enable resist fingerprinting
user_pref("privacy.resistFingerprinting", true);

// Enable tracking protection against cryptomining
user_pref("privacy.trackingprotection.cryptomining.enabled", true);

// Enable tracking protection
user_pref("privacy.trackingprotection.enabled", true);

// Enable tracking protection against fingerprinting
user_pref("privacy.trackingprotection.fingerprinting.enabled", true);

// Enable tracking protection in private browsing mode
user_pref("privacy.trackingprotection.pbmode.enabled", true);

// Enable user context new tab page segregation
user_pref("privacy.usercontext.about_newtab_segregation.enabled", true);

// Disable session identifiers in TLS handshakes
user_pref("security.ssl.disable_session_identifiers", true);

// Disable showing sponsored top sites on the new tab page
user_pref("services.sync.prefs.sync.browser.newtabpage.activity-stream.showSponsoredTopSite", false);

// Disable Background Hang Reporter (BHR) pings
user_pref("toolkit.telemetry.bhrPing.enabled", false);

// Clear cached client ID
user_pref("toolkit.telemetry.cachedClientID", "");

// Disable all telemetry
user_pref("toolkit.telemetry.enabled", false);

// Disable first shutdown ping
user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);

// Disable hybrid content telemetry
user_pref("toolkit.telemetry.hybridContent.enabled", false);

// Disable new profile ping
user_pref("toolkit.telemetry.newProfilePing.enabled", false);

// Set telemetry prompted state to 2 (user denied)
user_pref("toolkit.telemetry.prompted", 2);

// Set telemetry rejected state to true
user_pref("toolkit.telemetry.rejected", true);

// Disable reporting policy for first run
user_pref("toolkit.telemetry.reportingpolicy.firstRun", false);

// Clear telemetry server URL
user_pref("toolkit.telemetry.server", "");

// Disable shutdown ping sender
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);

// Set unified telemetry opt-in state to false
user_pref("toolkit.telemetry.unifiedIsOptIn", false);

// Disable update ping
user_pref("toolkit.telemetry.updatePing.enabled", false);

// Override WebGL renderer and vendor strings
user_pref("webgl.renderer-string-override", " ");
user_pref("webgl.vendor-string-override", " ");
