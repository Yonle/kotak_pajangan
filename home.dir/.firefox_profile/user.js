// Autoplay settings
user_pref("media.autoplay.default", 0);
user_pref("media.autoplay.blocking_policy", 0);

// WebGL/WebGPU enablement
user_pref("webgl.disabled", false);
user_pref("webgl.enable-webgl2", true);
user_pref("dom.webgpu.enabled", true);
user_pref("gfx.webgpu.force-enabled", true);

// Software rendering
user_pref("gfx.webrender.all", true);
user_pref("gfx.webrender.software", true);

// UI/feature suppression
user_pref("browser.shell.checkDefaultBrowser", false);
user_pref("browser.startup.homepage", "about:blank");
user_pref("browser.newtabpage.enabled", false);
user_pref("browser.newtab.url", "about:blank");
user_pref("browser.tabs.warnOnClose", false);
user_pref("browser.aboutConfig.showWarning", false);
user_pref("app.update.auto", false);
user_pref("toolkit.telemetry.enabled", false);
user_pref("dom.webnotifications.enabled", false);
user_pref("extensions.pocket.enabled", false);
user_pref("browser.translation.detectLanguage", false);
user_pref("signon.rememberSignons", false);
user_pref("browser.sessionstore.resume_from_crash", false);
user_pref("browser.safebrowsing.malware.enabled", false);
user_pref("accessibility.force_disabled", 1);

// Common permissions
user_pref("permissions.default.camera", 2);
user_pref("permissions.default.microphone", 2);
user_pref("permissions.default.geo", 2);
user_pref("permissions.default.desktop-notification", 2);
user_pref("permissions.default.pointerLock", 2);
user_pref("permissions.default.gamepad", 2);

// Advanced/emerging APIs
user_pref("permissions.default.xr", 2);          // WebXR (VR/AR)
user_pref("permissions.default.midi", 2);
user_pref("permissions.default.storage", 2);     // Persistent storage

// Sandbox exceptions (if needed)
user_pref("security.sandbox.content.level", 0);
user_pref("security.sandbox.gpu.level", 0);
