#!/bin/bash

xhost local:root # https://stackoverflow.com/questions/43015536/xhost-command-for-docker-gui-apps-eclipse
[ ! -d '/tmp/math-puzzles-in-lean4' ] && cd /tmp && git clone https://github.com/dwrensha/math-puzzles-in-lean4.git
docker run -u $(id -u):$(id -g) --rm -it \
	    -v /tmp/.X11-unix:/tmp/.X11-unix \
	    -v ${HOME}/tmp/eln-cache:/home/ubuntu/.emacs.d/eln-cache \
       -v ${HOME}/proj/lean:/lean-code \
       -e DISPLAY=${DISPLAY}  \
       --net=host \
       -h ${HOSTNAME} \
       -v ${HOME}/.Xauthority:/home/ubuntu/.Xauthority \
       --entrypoint=/home/ubuntu/scripts/run-emacs.sh lean4:latest

xhost -local:root
