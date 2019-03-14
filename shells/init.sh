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
  echo "deb http://mirrors.163.com/debian/ jessie main non-free contrib" > /etc/apt/sources.list && \
  echo "deb http://mirrors.163.com/debian/ jessie-updates main non-free contrib" >> /etc/apt/sources.list && \
  echo "deb http://mirrors.163.com/debian/ jessie-backports main non-free contrib" >> /etc/apt/sources.list && \
  echo "deb-src http://mirrors.163.com/debian/ jessie main non-free contrib" >> /etc/apt/sources.list && \
  echo "deb-src http://mirrors.163.com/debian/ jessie-updates main non-free contrib" >> /etc/apt/sources.list && \
  echo "deb-src http://mirrors.163.com/debian/ jessie-backports main non-free contrib" >> /etc/apt/sources.list && \
  echo "deb http://mirrors.163.com/debian-security/ jessie/updates main non-free contrib" >> /etc/apt/sources.list && \
  echo "deb-src http://mirrors.163.com/debian-security/ jessie/updates main non-free contrib" >> /etc/apt/sources.list && \
  echo "deb https://apt.dockerproject.org/repo debian-jessie main" >> /etc/apt/sources.list && \
  apt-get update && \
  apt-get install --no-install-recommends --no-install-suggests -y \
    gcc git lsof automake autoconf libtool make openssl \
    libssl-dev libpcre3 libpcre3-dev zlib1g-dev

apt-get install -y python-pip

pip install --upgrade pip