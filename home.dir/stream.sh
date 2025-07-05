
# stream=rtmps://example.com/.../private-key
stream=

while true; do
wf-recorder \
        --no-damage \
        --no-dmabuf \
        -o HEADLESS-1 \
        -f $stream \
        -m flv \
        -a@DEFAULT_MONITOR@ \
        -c libx264 \
        -F format=yuv420p \
        -p color_range=1 \
        -r 30 \
        -p minrate=2000k \
        -p maxrate=2000k \
        -p bufsize=2000k \
        -B 2000k \
        -p x264_params=nal_hrd=cbr:force-cfr=1 \
        -p preset=veryfast \
        -C aac \
        -P bitrate=128k
done
