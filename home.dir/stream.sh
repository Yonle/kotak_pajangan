
while true; do
ffmpeg \
  -avioflags direct \
  -loglevel warning \
  -thread_queue_size 64 \
  -f x11grab -draw_mouse 0 -framerate 30 -i $DISPLAY \
  -f pulse -thread_queue_size 1024 -i default \
  -c:v libx264 \
  -pix_fmt yuv420p \
  -color_range 1 \
  -r 30 \
  -g 60 \
  -minrate 3000k -maxrate 3000k -b:v 3000k \
  -bufsize 3000k \
  -x264-params "nal_hrd=cbr:force-cfr=1:keyint=60:min-keyint=60:scenecut=0" \
  -preset ultrafast -tune zerolatency \
  -c:a aac \
  -b:a 128k -strict -2 \
  -af aresample=async=1 \
  -f flv \
  -copyts \
  "$STREAM"

echo "Will try reconnecting again in 5 seconds..."
sleep 5
done
