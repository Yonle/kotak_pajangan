#!/usr/bin/env bash
find /tmp -mindepth 1 -delete
exec su -c "bash /home/a/init.sh" a
