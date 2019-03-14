#! /bin/sh

apt-get -y purge docker.io
apt-get -y install apt-transport-https ca-certificates

apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
apt-get update
apt-get -y install docker-engine

systemctl start docker

systemctl enable docker

# verfiy the docker
docker run hello-world

# To stop Docker service, run:
# systemctl stop docker


# To restart Docker service, run:
# systemctl restart docker


# To check the status of Docker service, run:
# systemctl status docker


# To enable Docker service to autostart on system boot, run:
# systemctl enable docker

# install docker-compose

pip install docker-compose

docker-compose --version