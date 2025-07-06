
while true; do
wf-recorder \
  -o HEADLESS-1 \
  -f $STREAM \
  -m flv \
  -a @DEFAULT_MONITOR@ \
  -c libx264 \
  -p pix_fmt=yuv420p \
  -r 30 \
  -p g=60 \
  -b:v 6000k \
  -p bufsize=12000k \
  -p preset=veryfast \
  -p x264_params="nal-hrd=cbr" \
  -C aac \
  -P bitrate=128k
done
