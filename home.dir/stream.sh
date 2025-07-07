
while true; do
ffmpeg \
  -thread_queue_size 512 \
  -f x11grab -draw_mouse 0 -framerate 30 -video_size 1920x1080 -i $DISPLAY \
  -f pulse -thread_queue_size 512 -i default \
  -c:v libx264 \
  -pix_fmt yuv420p \
  -color_range 1 \
  -r 30 \
  -g 60 \
  -minrate 6000k -maxrate 6000k -b:v 6000k \
  -bufsize 12000k \
  -x264-params "nal_hrd=cbr:force-cfr=1:keyint=60:min-keyint=60:scenecut=0" \
  -preset superfast -tune zerolatency \
  -c:a aac \
  -b:a 128k \
  -f flv \
  -copyts \
  "$STREAM"
done
