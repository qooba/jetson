FROM qooba/jetson:base
RUN rm /usr/bin/qemu-aarch64-static
ENV TZ=Europe/Warsaw LC_ALL=C.UTF-8 LANG=C.UTF-8
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && apt update && apt -yq install python3-pil python3-opencv libavdevice-dev libavfilter-dev libopus-dev libvpx-dev pkg-config python3-cffi
ENV DEBIAN_FRONTEND=noninteractive
RUN apt -yq install libffi-dev libssl-dev libsrtp2-dev
RUN pip3 install aiohttp aiortc
RUN pip3 install minio jinja2 cachetools pyyaml pyzmq watchdog[watchmedo]
RUN apt install curl git cmake ack vim-youcompleteme vim-syntastic -yq
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/qooba/vim-python-ide/master/setup.sh)"
RUN pip3 install aiohttp_cors ujson
WORKDIR /app/
CMD ["/bin/bash"]
