FROM docker.io/alpine:3.22

LABEL org.opencontainers.image.source="https://github.com/Yonle/kotak_pajangan" \
      org.opencontainers.image.description="a magical box that opens browser and screams its pixels at rtmp streams." \
      org.opencontainers.image.licenses="MIT"

RUN apk add --no-cache \
    tini i3wm chromium chromium-swiftshader pipewire pipewire-pulse pipewire-alsa wireplumber openrc bash dbus ffmpeg xvfb xvfb-run \
    fontconfig font-dejavu font-liberation font-jetbrains-mono font-wqy-zenhei font-noto-emoji \
    mesa mesa-gl mesa-egl mesa-gles mesa-dri-gallium mesa-gbm

RUN adduser -D -s /bin/bash a

COPY home.dir /home/a/

RUN chown -R a:a /home/a

RUN mkdir -p /run/openrc /tmp && \
    touch /run/openrc/softlevel && \
    rc-update add dbus default

RUN mkdir -m 1777 /tmp/.X11-unix

ENTRYPOINT ["/sbin/tini", "--"]

CMD ["/bin/bash", "-c", "/sbin/openrc default && su -c 'bash /home/a/init.sh' a"]
