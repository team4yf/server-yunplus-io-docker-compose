#! /bin/sh

#下载nvm
git clone git://github.com/creationix/nvm.git /home/yf/nvm

#设置nvm 自动运行;
echo "source /home/yf/nvm/nvm.sh" >> ~/.bashrc
source ~/.bashrc

#查询node版本
nvm list-remote

nvm install v10.15.3

npm i -g pm2 mocha nodemon