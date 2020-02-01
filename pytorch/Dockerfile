FROM nvcr.io/nvidia/l4t-base:r32.2.1
WORKDIR /
RUN apt update && apt install -y --fix-missing make g++ python3-pip libopenblas-base
RUN wget https://nvidia.box.com/shared/static/ncgzus5o23uck9i5oth2n8n06k340l6k.whl -O torch-1.4.0-cp36-cp36m-linux_aarch64.whl
RUN pip3 install Cython
RUN pip3 install numpy torch-1.4.0-cp36-cp36m-linux_aarch64.whl 
CMD [ "bash" ]
