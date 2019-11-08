#!/bin/bash

docker run --runtime nvidia --network host -it --rm --device=/dev/video0:/dev/video0 -p 8888:8888 -e DISPLAY=$DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix -v /home/qba/Qooba/jetson/app:/app qooba/jetson:fastapi /start-reload.sh
