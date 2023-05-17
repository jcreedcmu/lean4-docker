#!/bin/bash

WORKFILE=math-puzzles-in-lean4/MathPuzzles/UpperLowerContinuous.lean

xhost local:root # https://stackoverflow.com/questions/43015536/xhost-command-for-docker-gui-apps-eclipse
[ ! -d '/tmp/math-puzzles-in-lean4' ] && cd /tmp && git clone https://github.com/dwrensha/math-puzzles-in-lean4.git
docker run --rm -it \
	    -v /tmp/.X11-unix:/tmp/.X11-unix \
	    -v ${HOME}/tmp/eln-cache:/root/.emacs.d/eln-cache \
       --mount type=bind,source=/tmp/${WORKFILE},target=/vendor/${WORKFILE} \
       -e DISPLAY=${DISPLAY}  \
       --net=host \
       -h ${HOSTNAME} \
       -v ${HOME}/.Xauthority:/root/.Xauthority \
       --entrypoint=/root/scripts/run-lean-container.sh lean4:latest

#	    -v /tmp/math-puzzles-in-lean4:/vendor/math-puzzles-in-lean4 \

xhost -local:root
