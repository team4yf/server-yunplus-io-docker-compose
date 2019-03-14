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


# 0. install tool kits
yum install -y gcc git lsof yum-utils device-mapper-persistent-data lvm2

# 1.安装python-pip
yum -y install python-pip install epel-release

# 3.升级python-pip
pip install --upgrade pip