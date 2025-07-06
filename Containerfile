FROM docker.io/alpine:3.22

RUN apk add --no-cache \
    tini sway chromium pipewire pipewire-pulse pipewire-alsa wireplumber openrc bash dbus ffmpeg wf-recorder \
    fontconfig font-dejavu font-liberation font-jetbrains-mono font-wqy-zenhei font-noto-emoji \
    mesa-egl mesa-gles mesa-gbm mesa-vulkan-swrast vulkan-loader vulkan-tools

RUN adduser -D -s /bin/bash a

COPY home.dir /home/a/

RUN chown -R a:a /home/a

RUN mkdir -p /run/openrc /tmp && \
    touch /run/openrc/softlevel && \
    rc-update add dbus default

ENTRYPOINT ["/sbin/tini", "--"]

CMD ["/bin/bash", "-c", "/sbin/openrc default && su -c 'bash /home/a/init.sh' a"]
