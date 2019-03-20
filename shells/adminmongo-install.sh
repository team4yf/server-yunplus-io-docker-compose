#! /bin/sh

cd /home/yf/projects/nodejs/

git clone https://github.com/mrvautin/adminMongo.git && cd adminMongo

npm i --production

echo '{
    "app": {
        "host": "0.0.0.0",
        "port": 5234,
        "password": "741235896",
        "context": "dbApp",
        "monitoring": false
    }
}' > config/app.json

# run with pm2
pm2 start app.js --name mongo.yunplus.io -i 1