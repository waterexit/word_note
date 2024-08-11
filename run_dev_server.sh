#!/bin/bash
# rails server
rm -rf /app/${PROJECT_NAME}_api/tmp/pids/server.pid
bundle update --gemfile /app/${PROJECT_NAME}_api/Gemfile 
cd /app/${PROJECT_NAME}_api
rails server -b 0.0.0.0 -d

#vite server
cd /app/${PROJECT_NAME}_front
npm install
npm run dev -- --host &


