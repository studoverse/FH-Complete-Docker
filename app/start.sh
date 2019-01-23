#!/bin/bash

echo "Starting apache"
service apache2 restart # Apache won't start for some reason so start here

# Handle docker shutdown gracefully
cleanup () {
  kill -s SIGTERM $!
  exit 0
}
trap cleanup SIGINT SIGTERM

# We need this so the container stays alive
echo "Entering sleep"
while [[ 1 ]]
do
    sleep 60 &
    wait $!
done