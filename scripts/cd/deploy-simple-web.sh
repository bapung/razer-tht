#/bin/bash

APPNAME=simple-web

# install requirements
# apt install -y docker docker-compose git 

cd ../..

docker compose -f apps/${APPNAME}/docker-compose.yaml down && \
docker compose -f apps/${APPNAME}/docker-compose.yaml up -d