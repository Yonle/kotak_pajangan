pulseaudio --daemonize=yes --exit-idle-time=-1 --log-level=info \
  --load="module-native-protocol-unix socket=/tmp/pulse.sock"

export PULSE_SERVER=unix:/tmp/pulse.sock

exec xvfb-run -n 0 -s "-screen 0 1920x1080x24" dbus-run-session i3
