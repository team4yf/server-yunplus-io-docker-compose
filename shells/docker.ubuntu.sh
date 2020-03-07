#! /bin/sh
# 适用于开发的 PC

##### stage2. 安装基本的工具
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
    
###### stage4. 安装 docker
curl -fsSL https://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://mirrors.aliyun.com/docker-ce/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get -y update
sudo apt-get -y install docker-ce


# ./init.9x.dev.sh: 36: ./init.9x.dev.sh: cannot create /etc/docker/daemon.json: Permission denied
echo '{
    "registry-mirrors": [ "https://registry.docker-cn.com"],
    "insecure-registries": [ ]
  }' > daemon.json
  
  sudo mv daemon.json /etc/docker/daemon.json && \

  sudo systemctl start docker && \

  sudo systemctl enable docker

##### stage5. 安装 docker-compose

curl -L https://github.com/docker/compose/releases/download/1.24.1/docker-compose-`uname -s`-`uname -m` -o docker-compose
sudo  mv docker-compose /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
