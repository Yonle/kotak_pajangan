
if [ "$VNC" == "1" ]; then
	x11vnc -quiet -display $DISPLAY -rfbport 5900 -forever
fi
