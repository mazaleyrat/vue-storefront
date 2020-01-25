#!/bin/sh
set -e

yarn install || exit $?

<<<<<<< HEAD
=======
yarn build:client && yarn build:server && yarn build:sw || exit $?

>>>>>>> upstream/master
if [ "$VS_ENV" = 'dev' ]; then
  yarn dev
else
  yarn build:client && yarn build:server || exit $?
  yarn start
fi
