#!/bin/bash

set -e

rm -rf /app/tmp/pids/server.pid
if [ ! -d /app/word_note ]; then
  rails new word_note --api
  bundle install --genfile /app/word_note/genfile 
fi
exec "$@"
