#! /bin/sh
# 针对通过 普通 用户登录的 debian9 操作系统的初始化
# 适用于开发的 PC

##### stage2. 安装基本的工具
sudo apt install --fix-missing apt-transport-https && \
  sudo apt-get update && \
  sudo apt install --no-install-recommends --no-install-suggests -y \
    gcc git lsof \
    automake autoconf libtool make openssl \
    libssl-dev libpcre3 libpcre3-dev zlib1g-dev \
    python3-pip

##### stage3. 下载 nvm，准备安装 nodejs

cd ~
git clone git://github.com/creationix/nvm.git 
echo "source ~/nvm/nvm.sh" >> ~/.bashrc
source ~/.bashrc


nvm install v10.16.2
###### stage4. 安装 docker
sudo apt -y install ca-certificates curl gnupg2 software-properties-common && \
  sudo apt -y purge docker.io && \
  sudo curl -fsSL https://mirrors.aliyun.com/docker-ce/linux/debian/gpg | sudo apt-key add - && \
  sudo add-apt-repository \
    "deb [arch=amd64] https://mirrors.aliyun.com/docker-ce/linux/debian \
    $(lsb_release -cs) \
    stable" && \

  sudo apt-get update && \
  sudo apt-cache policy docker-ce && \
  sudo apt-get -y install docker-ce && \

# ./init.9x.dev.sh: 36: ./init.9x.dev.sh: cannot create /etc/docker/daemon.json: Permission denied
  sudo echo '{
    "registry-mirrors": [ "https://registry.docker-cn.com"],
    "insecure-registries": [ ]
  }' > /etc/docker/daemon.json && \

  sudo systemctl start docker && \

  sudo systemctl enable docker

##### stage5. 安装 docker-compose

sudo curl -L https://github.com/docker/compose/releases/download/1.24.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose