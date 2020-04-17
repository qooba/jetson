FROM qooba/jetson:torchvision_0.5.0
RUN pip3 install jupyterlab
ENV TZ=Europe/Warsaw
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && apt update && apt -yq install npm nodejs python3-pil python3-opencv
RUN apt update && apt -yq install python3-matplotlib
RUN git clone https://github.com/NVIDIA-AI-IOT/torch2trt.git /torch2trt && mv /torch2trt/torch2trt /usr/local/lib/python3.6/dist-packages && rm -r /torch2trt
COPY tensorrt /usr/lib/python3.6/dist-packages/tensorrt
RUN pip3 install --no-deps fastai
RUN git clone https://github.com/fastai/fastai /fastai
RUN apt update && apt install libblas3 liblapack3 liblapack-dev libblas-dev gfortran -yq
RUN pip3 install scipy 
RUN pip3 install pandas
COPY blis-0.4.0-cp36-cp36m-linux_aarch64.whl .
RUN pip3 install blis-0.4.0-cp36-cp36m-linux_aarch64.whl
RUN pip3 install spacy
RUN pip3 install fastai
RUN pip3 install scikit-learn
#RUN cd /fastai && pip3 install $(python3 setup.py -q deps --dep-groups=core,vision)
CMD [ "bash" ]
