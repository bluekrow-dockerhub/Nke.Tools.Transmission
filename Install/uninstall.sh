#!/bin/sh
set -eu

sudo systemctl stop transmission.docker
sudo systemctl disable transmission.docker
sudo rm /etc/systemd/system/transmission.docker.service
sudo rm -r /opt/docker-transmission