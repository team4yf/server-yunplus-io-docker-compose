#! /bin/sh

# Author: yfsoft
# Version: 1.0.0
# Date: 2019-03-14

# Console Color Defined
RED_COLOR='\E[1;31m'
GREEN_COLOR='\E[1;32m'
YELOW_COLOR='\E[1;33m'
BLUE_COLOR='\E[1;34m'
PINK='\E[1;35m'
RES='\E[0m'

# Clear The Screen
clear

YF_HOME_DIR="/home/yf"

set -ex && \
  echo "export LC_ALL=C" >> ~/.bashrc && \
  source ~/.bashrc && \
  mv /etc/apt/sources.list /etc/apt/sources.list.bak && \
  echo "deb http://mirrors.163.com/debian/ stretch main non-free contrib" > /etc/apt/sources.list && \
  echo "deb http://mirrors.163.com/debian/ stretch-updates main non-free contrib" >> /etc/apt/sources.list && \
  echo "deb http://mirrors.163.com/debian/ stretch-backports main non-free contrib" >> /etc/apt/sources.list && \
  echo "deb-src http://mirrors.163.com/debian/ stretch main non-free contrib" >> /etc/apt/sources.list && \
  echo "deb-src http://mirrors.163.com/debian/ stretch-updates main non-free contrib" >> /etc/apt/sources.list && \
  echo "deb-src http://mirrors.163.com/debian/ stretch-backports main non-free contrib" >> /etc/apt/sources.list && \
  echo "deb http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib" >> /etc/apt/sources.list && \
  echo "deb-src http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib" >> /etc/apt/sources.list
  # Fix the issue @ https://github.com/team4yf/server-yunplus-io-docker-compose/issues/1
  apt-get install --fix-missing apt-transport-https && \
  apt-get update && \
  apt-get install --no-install-recommends --no-install-suggests -y \
    gcc git lsof \
    automake autoconf libtool make openssl \
    libssl-dev libpcre3 libpcre3-dev zlib1g-dev

# 中文乱码
apt-get install -y ttf-wqy-*

apt-get install -y python3-pip
