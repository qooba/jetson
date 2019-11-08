# jetson
Jetson nano docker images

scripts and configuration for fast api taken from: https://github.com/tiangolo/uvicorn-gunicorn-fastapi-docker

To build you need to install **qemu**:
```
sudo apt-get install -y qemu binfmt-support qemu-user-static
wget http://archive.ubuntu.com/ubuntu/pool/main/b/binfmt-support/binfmt-support_2.1.8-2_amd64.deb
sudo apt install ./binfmt-support_2.1.8-2_amd64.deb
rm binfmt-support_2.1.8-2_amd64.deb
cp /usr/bin/qemu-aarch64-static ./base
```


