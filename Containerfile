FROM docker.io/debian:bookworm-slim

LABEL org.opencontainers.image.source="https://github.com/Yonle/kotak_pajangan" \
      org.opencontainers.image.description="a magical box that opens browser and screams its pixels at rtmp streams." \
      org.opencontainers.image.licenses="MIT"

RUN apt update && apt install -y --no-install-recommends \
    locales tini i3-wm chromium ffmpeg dbus-x11 bash xvfb xauth x11vnc pulseaudio \
    fontconfig fonts-dejavu fonts-liberation fonts-jetbrains-mono fonts-noto-color-emoji fonts-wqy-zenhei \
    mesa-utils libgl1-mesa-dri libgl1-mesa-glx libegl1-mesa libgles2-mesa libgbm1 \
 && apt clean \
 && rm -rf /var/lib/apt/lists/*

RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG=en_US.utf8

COPY entrypoint.sh /root/entrypoint.sh

RUN useradd -ms /bin/bash a

COPY home.dir /home/a/

RUN chown -R a:a /home/a

ENTRYPOINT ["/usr/bin/tini", "--", "/root/entrypoint.sh"]
