FROM qooba/jetson:torchvision_0.5.0
RUN pip3 install jupyterlab
ENV TZ=Europe/Warsaw
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && apt update && apt -yq install npm nodejs python3-pil python3-opencv
CMD [ "bash" ]
