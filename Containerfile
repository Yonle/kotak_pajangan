FROM docker.io/alpine:3.22

LABEL org.opencontainers.image.source="https://github.com/Yonle/kotak_pajangan" \
      org.opencontainers.image.description="a magical box that opens browser and screams its pixels at rtmp streams." \
      org.opencontainers.image.licenses="MIT"

RUN apk add --no-cache \
    bash tini dbus xauth xvfb xvfb-run x11vnc pulseaudio \
    i3wm chromium chromium-swiftshader ffmpeg \
    fontconfig font-dejavu font-liberation font-jetbrains-mono font-wqy-zenhei font-noto-emoji \
    mesa mesa-gl mesa-egl mesa-dri-gallium mesa-gbm mesa-vulkan-swrast vulkan-loader

COPY entrypoint.sh /root/entrypoint.sh

RUN adduser -D -s /bin/bash a

COPY home.dir /home/a/

RUN chown -R a:a /home/a

ENTRYPOINT ["tini", "--", "/root/entrypoint.sh"]
