
export LIBGL_ALWAYS_SOFTWARE=1
export GALLIUM_DRIVER=llvmpipe

export MOZ_DISABLE_SHM=1
export MOZ_ENABLE_WAYLAND=0

firefox \
  --profile /home/a/.firefox_profile \
  --no-remote \
  --new-instance \
  --kiosk "$WEB"
