#!/usr/bin/env bash

PROJECT_NAME=myproject

docker-compose -p ${PROJECT_NAME} down --remove-orphans
