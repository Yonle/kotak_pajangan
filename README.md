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

if you prefer building manually, then build the image by running the following command if you use:
- docker: `docker build -f Containerfile -t kotak`
- podman: `podman build -f Containerfile -t kotak`

or if you prefer to download a prebuild one...
- docker: `docker pull ghcr.io/yonle/kotak_pajangan:master`
- podman: `podman pull ghcr.io/yonle/kotak_pajangan:master`

now just create le container.
- docker: `docker create --name pajangan -e STREAM=rtmps://live.example.com/abcdef123456 -e WEB=https://webglsamples.org/aquarium/aquarium.html kotak`
- podman: `podman create --name pajangan -e STREAM=rtmps://live.example.com/abcdef123456 -e WEB=https://webglsamples.org/aquarium/aquarium.html kotak`

**IMPORTANT**: If you pull from `ghcr.io/yonle/kotak_pajangan`, You must replace `kotak` with `ghcr.io/yonle/kotak_pajangan`

finally, start it.
- docker: `docker start pajangan`
- podman: `podman start pajangan`
