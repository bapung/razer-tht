#/bin/bash

APPNAME=registry
# install requirements
# apt install -y docker docker-compose git 

cd ../..

# simulate getting env file from secure source (e.g. vault)
# vault login && vault-script-populate-env.sh
# cp $(pwd)/apps/${APPNAME}/.local-env.dummy $(pwd)/apps/${APPNAME}/.env

scripts/populate-secret.sh $(pwd)/apps/${APPNAME}/config.yml.tpl $(pwd)/apps/registry/.env
scripts/populate-secret.sh $(pwd)/apps/${APPNAME}/htpasswd-registry.tpl $(pwd)/apps/registry/.env

docker compose -f apps/${APPNAME}/docker-compose.yaml down && \
docker compose -f apps/${APPNAME}/docker-compose.yaml up -d