# README

## Project structure

- infra : terraform codes to provision infrastructures, `infra/${aws_account_name}/${appname}` correspond to infra needed for `apps/${appname}/` app
- apps : apps configuration, template, deployment manifests (docker-compose.yml). each folder is one app.
- scripts/cd : files `deploy-${appname}.sh` are used to deploy `apps/${appname}/`
- script/populate-secret.sh : replace environment variables from first argument `configname.tpl` by env defined in second argument `.env` file


## How to Deploy Apps?

1. Check each app directory's .env.example for required environment variables
2. Create a .env in app directory e.g. app/registry/.env . Note: this  step *simulates* getting environment variables from secure source like CI secret store or Vault.
3. Go to scripts/cd/ and run the deployment script for target app, e.g. `deploy-registry.sh`