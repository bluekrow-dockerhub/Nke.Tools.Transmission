#!/bin/sh
set -eu

echo "Stopping Transmission service unit"
sudo systemctl stop transmission.docker
echo "Disabling Transmission service unit"
sudo systemctl disable transmission.docker
echo "Removing service unit"
sudo rm /etc/systemd/system/transmission.docker.service
echo "Removing service scripts"
sudo rm -r /opt/docker-transmission

echo "Uninstall Done"