# kotak pajangan

![Screenshot](./screenshot.png)

a box (container) that open a browser and then livestream it via RTMP.

what it lets you do:
- live stream what's available on the web to destination stream via rtmp

what it doesn't let you do:
- control it (but you could manually install `wayvnc` and remote it here)

**notable notice**:
- it works without DRI involved
- but that also means that your CPU will scream **hard** because **everything is software rendered**

## getting it to work

you will need to have either [docker](https://docker.com) or [podman](https://podman.io) installed in your system

then, edit the following files:
- `home.dir/kiosk.sh` on `addr=` section
- `home.dir/stream.sh` on `stream=` section

once you get it working, build the image by running the following if you use:
- docker: `docker build -f Containerfile -t kotak`
- podman: `podman build -t kotak`

and finally, just run it, and see your stream
- docker: `docker run --rm -d -it --name pajangan kotak`
- podman: `podman run --rm -d -it --name pajangan kotak`
