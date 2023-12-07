#!/bin/bash
sudo apt-get update
sudo apt-get install mongodb -y
sudo systemctl start mongodb
sudo systemctl enable mongodb
sudo systemctl status mongodb
