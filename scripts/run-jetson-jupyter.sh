#!/bin/bash

docker run --runtime nvidia --network host -d --rm --device=/dev/video0:/dev/video0 -p 8888:8888 -e DISPLAY=$DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix -v /home/qba/Qooba/jetson/jupyter:/opt/notebooks qooba/jetson:jupyter /bin/bash -c "jupyter lab --notebook-dir=/opt/notebooks --ip='0.0.0.0' --port=8888 --no-browser --allow-root --NotebookApp.password='pass' --NotebookApp.token='pass'"
