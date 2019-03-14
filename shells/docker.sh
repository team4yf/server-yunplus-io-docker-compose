#! /bin/sh

uname -r

yum update

yum remove docker docker-common docker-selinux docker-engine

yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

yum list docker-ce --showduplicates | sort -r

yum install -y docker-ce

systemctl start docker

systemctl enable docker

docker version

# install docker-compose

# 4.安装docker-compse
pip install docker-compose
# 5.查看版本号
docker-compose -version
# 6.卸载
# pip uninstall docker-compose
# 7.安装指定版本
# pip install docker-compose=1.23.1