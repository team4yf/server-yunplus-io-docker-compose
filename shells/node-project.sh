#! /bin/sh

cd /home/yf/projects/nodejs

# the webhook.yunplus.io
git clone git@github.com:yfsoftcom/webhook.yunplus.io.git

# echo the config.json
echo '{
    "server":
    {
        "hostname": "0.0.0.0",
        "domain": "localhost",
        "port": 9003
    }
}
' > config.json

# the api.yunplus.io
git clone git@github.com:team4yf/api.yunplus.io.git

# echo the config.json

echo '{
  "server":
  {
      "hostname": "0.0.0.0",
      "domain": "api.yunplus.io",
      "port": 9991
  },
  "defaultVersion":"0.0.1",
  "dev": "PRODUCT",
  "log4js":
  {
      "appenders": {
        "app": { "type": "dateFile", "filename": "logs/app.log", "pattern": ".yyyy-MM-dd-hh", "compress": true }
      },
      "categories": {
        "default": { "appenders": [ "app" ], "level": "debug"}
      }
  },
  "apps": {
    "123123": {
      "appkey": "123123",
      "approot": "*",
      "secretkey": "123123"
    }
  },
  "mysql": {
    "host":"localhost",
    "database":"fpm",
    "username":"dbadmin",
    "password":"741235896",
    "showSql": true
  },
  "email": {
    "service": "qq",
    "user": "88888888@qq.com",
    "pass": "88888888"
  },
  "jpush": {
    "appkey": "eb1b4ead0ba8b161cbfaa7ec",
    "secretkey": "64031a878a3389eeb3dc80a8"
  },
  "juheSms": {
    "appkey": "1a6c0e78e6ce02680e1d92b40181d3dc"
  }
}' > config.json


# pm2 start
cd webhook.yunplus.io && npm i && pm2 start app.js --name webhook.yunplus.io -i 1 && cd ..
cd api.yunplus.io && npm i && pm2 start app.js --name api.yunplus.io -i 1 && cd ..
