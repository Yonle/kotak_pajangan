
export LIBGL_ALWAYS_SOFTWARE=1
export GALLIUM_DRIVER=llvmpipe
export VK_ICD_FILENAMES="/usr/share/vulkan/icd.d/lvp_icd.x86_64.json:/usr/share/vulkan/icd.d/swiftshader_icd.x86_64.json"

# addr=https://webglsamples.org/aquarium/aquarium.html
addr=

chromium \
  --no-sandbox \
  --ozone-platform=wayland \
  --ozone-platform-hint=auto \
  --enable-features=UseOzonePlatform \
  --disable-dev-shm-usage \
  --use-vulkan=swiftshader \
  --use-angle=vulkan \
  --enable-features=Vulkan \
  --ignore-gpu-blocklist \
  --enable-unsafe-webgpu \
  --disable-gpu-compositing \
  --disable-software-rasterizer \
  --enable-webgl \
  --enable-webgl2 \
  --autoplay-policy=no-user-gesture-required \
  --disable-translate \
  --disable-features=TranslateUI \
  --disable-sync \
  --disable-background-networking \
  --disable-background-timer-throttling \
  --disable-default-apps \
  --disable-component-update \
  --disable-domain-reliability \
  --disable-infobars \
  --disable-session-crashed-bubble \
  --disable-notifications \
  --disable-breakpad \
  --disable-logging \
  --disable-hang-monitor \
  --disable-backing-store-limit \
  --noerrdialogs \
  --deny-permission-prompts \
  --renderer-process-limit=1 \
  --in-process-gpu \
  --single-process \
  --kiosk $addr
