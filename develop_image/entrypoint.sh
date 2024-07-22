#!/bin/bash

set -e

rm -rf /app/tmp/pids/server.pid
if [ ! -f /app/${PROJECT_NAME}_api/Gemfile ]; then
  rails new ${PROJECT_NAME}_api --api
  bundle install --gemfile /app/${PROJECT_NAME}_api/Gemfile 
fi

if [ ! -f /app/${PROJECT_NAME}_front/package.json ]; then
  npm create -y vite@latest ${PROJECT_NAME}_front -- --template react-swc-ts
  cd /app/${PROJECT_NAME}_front
  npm install
  npx tailwindcss init
  cd /app
fi
exec "$@"
