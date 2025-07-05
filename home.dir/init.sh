
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

export WLR_BACKENDS=headless
export WLR_NO_HARDWARE_CURSORS=1
export WLR_LIBINPUT_NO_DEVICES=1
export WLR_CURSOR_HIDE_WHEN_UNFOCUSED=1
export WLR_RENDERER=pixman

dbus-run-session sway
