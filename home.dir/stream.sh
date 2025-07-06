
while true; do
ffmpeg \
  -f x11grab -draw_mouse 0 -framerate 30 -video_size 1920x1080 -i :0 \
  -f pulse -i default \
  -c:v libx264 \
  -pix_fmt yuv420p \
  -color_range 1 \
  -r 30 \
  -g 60 \
  -minrate 6000k -maxrate 6000k -b:v 6000k \
  -bufsize 12000k \
  -x264-params "nal_hrd=cbr:force-cfr=1:keyint=30:min-keyint=30:scenecut=0" \
  -preset superfast \
  -c:a aac \
  -b:a 128k \
  -f flv \
  "$STREAM"
done
