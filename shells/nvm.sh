#! /bin/sh

#下载nvm
git clone git://github.com/creationix/nvm.git ~/nvm

#设置nvm 自动运行;
echo "source ~/nvm/nvm.sh" >> ~/.bashrc
source ~/.bashrc

#查询node版本
nvm list-remote