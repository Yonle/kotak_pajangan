
if [ "$VNC" == "1" ]; then
	x11vnc -display $DISPLAY -rfbport 5900 -forever -noxdamage
fi
