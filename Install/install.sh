#!/bin/sh
set -eu

sudo rm -rf /opt/docker-transmission
sudo mkdir -p /opt/docker-transmission

sudo cp transmission-start.sh /opt/docker-transmission/
sudo cp transmission-stop.sh /opt/docker-transmission/

sudo cp transmission.docker.service /etc/systemd/system/

sudo systemctl start transmission.docker
sudo systemctl enable transmission.docker
sudo systemctl status transmission.docker
