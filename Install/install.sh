#!/bin/sh
set -eu

SERVICE_NAME="Docker Transmission"
SERVICE_UNIT="transmission.docker"
SERVICE_PATH="docker-transmission"

echo "REINSTALLING: $SERVICE_NAME"
echo "---------------------------"

echo "Disabling old $SERVICE_NAME service"
sudo systemctl disable ${SERVICE_UNIT}
echo "Stopping old $SERVICE_NAME service"
sudo systemctl stop ${SERVICE_UNIT}

echo "Removing $SERVICE_NAME scripts"
sudo rm -rf /opt/${SERVICE_PATH}
echo "Reinstalling new $SERVICE_NAME scripts"
sudo mkdir -p /opt/${SERVICE_PATH}
sudo cp ${SERVICE_UNIT}-start.sh /opt/${SERVICE_PATH}/
sudo cp ${SERVICE_UNIT}-stop.sh /opt/${SERVICE_PATH}/
echo "Reinstalling new $SERVICE_NAME service unit"
sudo cp ${SERVICE_UNIT}.service /etc/systemd/system/
sudo chmod 644 /etc/systemd/system/${SERVICE_UNIT}.service

echo "Starting new $SERVICE_NAME service"
sudo systemctl start ${SERVICE_UNIT}
echo "Enabling new $SERVICE_NAME service"
sudo systemctl enable ${SERVICE_UNIT}
echo "Resport new $SERVICE_NAME status"
sudo systemctl status ${SERVICE_UNIT}
