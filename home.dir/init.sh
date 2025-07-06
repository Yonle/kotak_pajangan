
if [ -z "$XDG_RUNTIME_DIR" ]; then
	XDG_RUNTIME_DIR="/tmp/$(id -u)-runtime-dir"

	mkdir -pm 0700 "$XDG_RUNTIME_DIR"
	export XDG_RUNTIME_DIR
fi

if [ ! -d /home/a/.config/rc/runlevels/gui ]; then
	mkdir -p /home/a/.config/rc/runlevels/gui
	rc-update -U add pipewire gui
	rc-update -U add pipewire-pulse gui
	rc-update -U add wireplumber gui
fi

openrc --user gui

rm /tmp/.X0-lock

xvfb-run -n 0 -s "-screen 0 1920x1080x24" dbus-run-session i3
