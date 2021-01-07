#!/bin/sh

echo "Stopping Transmission container"
/usr/bin/docker stop transmission
echo "Removing Transmission container"
/usr/bin/docker rm transmission

echo "Done"
