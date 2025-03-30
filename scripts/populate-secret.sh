#!/bin/bash

TPL_FILENAME=$1
ENV_FILENAME=$2

OUT_FILENAME=$(echo "${TPL_FILENAME}" | sed 's/.tpl//')

# Getting environment variables from .env file
# .env file should only be stored securely during CI/CD
if [ -f "${ENV_FILENAME}" ]; then
  export $(grep -v '^#' "${ENV_FILENAME}" | xargs) 
fi

echo "[DEBUG] subtituting values from file ${TPL_FILENAME}. output filename: ${OUT_FILENAME}"

envsubst < "${TPL_FILENAME}" > "${OUT_FILENAME}"