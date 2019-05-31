#! /bin/sh
# 针对通过 root 用户登录的 debian9 操作系统的初始化

##### stage1. 设定 apt 源
mv /etc/apt/sources.list /etc/apt/sources.list.bak && \
  echo 'deb http://mirrors.163.com/debian/ stretch main non-free contrib
deb http://mirrors.163.com/debian/ stretch-updates main non-free contrib
deb http://mirrors.163.com/debian/ stretch-backports main non-free contrib
deb-src http://mirrors.163.com/debian/ stretch main non-free contrib
deb-src http://mirrors.163.com/debian/ stretch-updates main non-free contrib
deb-src http://mirrors.163.com/debian/ stretch-backports main non-free contrib
deb http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib
deb-src http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib' >> /etc/apt/sources.list

apt update

##### stage2. 安装基本的工具
apt install --fix-missing apt-transport-https && \
  apt-get update && \
  apt install --no-install-recommends --no-install-suggests -y \
    gcc git lsof \
    automake autoconf libtool make openssl \
    libssl-dev libpcre3 libpcre3-dev zlib1g-dev \
    python3-pip

##### stage3. 下载 nvm，准备安装 nodejs
git clone git://github.com/creationix/nvm.git ~
echo "source ~/nvm/nvm.sh" >> ~/.bashrc
source ~/.bashrc

###### stage4. 安装 docker
apt -y install ca-certificates curl gnupg2 software-properties-common && \
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
    "insecure-registries": [ ]
  }' > /etc/docker/daemon.json && \

  systemctl start docker && \

  systemctl enable docker

##### stage5. 安装 docker-compose
pip install docker-compose


##### stage6. 生成 ssh key
cd ~
ssh-keygen -t rsa -b 4096 -C "yfsoftcom@126.com"
eval "$(ssh-agent -s)"
cat ~/.ssh/id_rsa.pub
