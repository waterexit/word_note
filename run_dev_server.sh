#!/bin/bash
rm -rf /app/${PROJECT_NAME}_api/tmp/pids/server.pid
bundle update --gemfile /app/${PROJECT_NAME}_api/Gemfile 
cd /app/${PROJECT_NAME}_api
rails server -b 0.0.0.0

# cd /app/${PROJECT_NAME}_front
# npm install
