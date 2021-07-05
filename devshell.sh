#!/usr/bin/env bash

PROJECT_NAME=myproject
DEV_CONTAINER=dev
RC_FILE=/src/.devshell_bashrc

if [ "$1" == "-b" ]; then
  docker-compose -p ${PROJECT_NAME} build
fi

# Check if the dev container is already up. If it's not, then start it
[ ! "$(docker ps | grep ${DEV_CONTAINER})" ] && docker-compose -p ${PROJECT_NAME} up -d ${DEV_CONTAINER}

# Enter the dev shell and load the rc file
docker exec -it -e "TERM=xterm-256color" "${PROJECT_NAME}_${DEV_CONTAINER}_1" bash --rcfile ${RC_FILE}
