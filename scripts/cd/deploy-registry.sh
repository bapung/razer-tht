#/bin/bash

# install requirements
# apt install -y docker docker-compose git 

cd ../..

# simulate getting env file from secure source (e.g. vault)
# vault login && vault-script-populate-env.sh
cp $(pwd)/apps/registry/.local-env.dummy $(pwd)/apps/registry/.env

scripts/populate-secret.sh $(pwd)/apps/registry/config.yml.tpl $(pwd)/apps/registry/.env
scripts/populate-secret.sh $(pwd)/apps/registry/htpasswd-registry.tpl $(pwd)/apps/registry/.env

docker compose -f apps/registry/docker-compose.yaml down && \
docker compose -f apps/registry/docker-compose.yaml up -d