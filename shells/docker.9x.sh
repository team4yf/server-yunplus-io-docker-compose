#! /bin/sh

sudo apt -y install ca-certificates curl gnupg2 software-properties-common && \
  apt -y purge docker.io && \
  curl -fsSL https://mirrors.aliyun.com/docker-ce/linux/debian/gpg | apt-key add - && \
  add-apt-repository \
    "deb [arch=amd64] https://mirrors.aliyun.com/docker-ce/linux/debian \
    $(lsb_release -cs) \
    stable" && \

  apt-get update && \
  apt-cache policy docker-ce && \
  apt-get -y install docker-ce && \

  echo '{
    "registry-mirrors": [ "https://registry.docker-cn.com"],
    "insecure-registries": [ "192.168.100.196:5000"]
  }' > /etc/docker/daemon.json && \

  systemctl start docker && \

  systemctl enable docker && \

  # 建立docker组
  groupadd docker && \

# 将用户添加到docker组
  usermod -aG docker $USER  && \

# verfiy the docker
  docker run hello-world && \

# To stop Docker service, run:
# systemctl stop docker


# To restart Docker service, run:
# systemctl daemon-reload
# systemctl restart docker


# To check the status of Docker service, run:
# systemctl status docker


# To enable Docker service to autostart on system boot, run:
# systemctl enable docker

# install docker-compose

  pip3 install docker-compose && \

  docker-compose --version

# get the private docker source
