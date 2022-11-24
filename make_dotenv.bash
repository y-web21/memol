#!/usr/bin/env bash
echo UID=$(id -u) > .env
echo USER_NAME=$(id -u -n) >> .env
echo GID=$(id -g) >> .env
echo GROUP_NAME=$(id -g -n) >> .env
echo succesfully
