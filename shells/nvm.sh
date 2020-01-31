#! /bin/sh

if [ -d ~/nvm ]; then
    echo "nvm installed!"
else
    #下载nvm
    git clone git://github.com/creationix/nvm.git ~/nvm
    #设置nvm 自动运行;
    echo "source ~/nvm/nvm.sh" >> ~/.bashrc
    source ~/.bashrc
fi

#查询node版本
nvm list-remote

nvm install v10.15.3

npm i -g pm2 mocha nodemon