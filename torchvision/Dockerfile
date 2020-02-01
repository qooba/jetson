FROM qooba/jetson:pytorch_1.4.0
WORKDIR /
RUN apt update && apt install libjpeg-dev zlib1g-dev git libopenmpi-dev openmpi-bin -yq
RUN git clone --branch v0.5.0 https://github.com/pytorch/vision torchvision
RUN cd torchvision && python3 setup.py install
CMD [ "bash" ]
