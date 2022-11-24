#! /bin/sh
set -e

if [ ! -d ${HOME}/.bundle ]; then
  bundle install
fi
if [ ! -f ${HOME}/jekyll/_config.yml ]; then
  cd ${HOME}/jekyll
  bundle exec jekyll new --skip-bundle --force .
fi

exec "$@"
