FROM qooba/jetson:base
ENV TZ=Europe/Warsaw
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && apt update && apt -yq install python3-pil python3-opencv
RUN pip3 install uvicorn gunicorn fastapi aiofiles pyzmq
COPY ./start.sh /start.sh
RUN chmod +x /start.sh
COPY ./gunicorn_conf.py /gunicorn_conf.py
COPY ./start-reload.sh /start-reload.sh
RUN chmod +x /start-reload.sh
RUN rm /usr/bin/qemu-aarch64-static
COPY ./app /app
WORKDIR /app/
ENV PYTHONPATH=/app
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
EXPOSE 80
CMD ["/start.sh"]
