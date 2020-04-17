#!/bin/bash
cp -r /usr/lib/python3.6/dist-packages/tensorrt .
docker build -t qooba/jetson:fastai .
