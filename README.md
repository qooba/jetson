# jetson
Jetson nano docker images

scripts and configuration for fast api taken from: https://github.com/tiangolo/uvicorn-gunicorn-fastapi-docker

## Introduction

Docker images for raspberrypi 

## Qemu

To build you need to install **qemu**:
```
sudo apt-get install -y qemu binfmt-support qemu-user-static
wget http://archive.ubuntu.com/ubuntu/pool/main/b/binfmt-support/binfmt-support_2.1.8-2_amd64.deb
sudo apt install ./binfmt-support_2.1.8-2_amd64.deb
rm binfmt-support_2.1.8-2_amd64.deb
cp /usr/bin/qemu-aarch64-static ./base
```

## Installation

Install [Nvidia JetPack](https://developer.nvidia.com/embedded/jetpack) with [Etcher](https://www.balena.io/etcher/)

Disable gui
```
sudo systemctl set-default multi-user.target
```

Set high power mode 
```
sudo nvpmodel -m 0
```

Disable swap
```
sudo swapoff -a
```

set nvidia default runtime in
***/etc/docker/daemon.json**
```
{
  “default-runtime”: “nvidia”,
  “runtimes”: {
    “nvidia”: {
      “path”: “nvidia-container-runtime”,
      “runtimeArgs”: []
     }
   }
}
```

Update system
```
sudo apt-get update
sudo apt-get dist-upgrade
```

Add docker privileges
```
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
```

## Set Static IP

```
sudo apt-get install netplan.io
```

example config in ***/etc/netplan/config.yaml***
```
network:
  version: 2
  renderer: networkd
  ethernets:
    eth0:
      addresses:
        - 192.168.1.13/24
      gateway4: 192.168.1.1
      nameservers:
          addresses: [8.8.8.8, 8.8.4.4]

```

run
```
sudo netplan apply
```

## Install docker (not needed for Nvidia Jetpack)

```
sudo apt install docker.io
sudo systemctl enable docker
```

## Install kubernetes

```
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add

sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"

sudo apt-get update

sudo apt-get install -y kubelet kubeadm kubectl kubernetes-cni

```

set up master node:
```
sudo kubeadm init --pod-network-cidr=10.244.0.0/16 --kubernetes-version "1.16.2"
```


set kubeadm priveleges:
```
sudo cp /etc/kubernetes/admin.conf $HOME/
sudo chown $(id -u):$(id -g) $HOME/admin.conf
export KUBECONFIG=$HOME/admin.conf
```

add slave nodes:
```
kubeadm join 192.168.100.6:6443 --token 06tl4c.oqn35jzecidg0r0m --discovery-token-ca-cert-hash sha256:c40f5fa0aba6ba311efcdb0e8cb637ae0eb8ce27b7a03d47be6d966142f2204c
```

check nodes:
```
kubectl get nodes
```

## Deploy flanned pod network

```
sudo kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
```

verify:
```
kubectl get pods --all-namespaces
sudo kubectl get nodes
```
