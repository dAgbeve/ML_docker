#!/bin/sh
XSOCKET=/tmp/.X11-unix
XAUTHTY=/tmp/.docker.xauth
touch $XAUTHTY
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTHTY nmerge -

docker run -u $(id -u):$(id -g) -it --rm --env="DISPLAY" \
    --env="XAUTHORITY=${XAUTHTY}" --volume=${XSOCKET}:${XSOCKET}:rw \
    -p 8888:8888 -p 6006:6006 \
    --volume $(pwd):/home/jovyan/notebook ai-ml-pjt bash
