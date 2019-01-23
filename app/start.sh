#!/bin/bash

echo "Starting apache"
service apache2 restart # Apache won't start for some reason so start here

# We need this so the container stays alive
echo "Entering sleep"
while [[ 1 ]]
do
    sleep 3600
done