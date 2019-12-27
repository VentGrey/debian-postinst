#!/usr/bin/env bash

# Yes bash, will be the default shell

dpkg -l | grep -qw gdebi || sudo apt install -yyq gdebi;

# Update repositories

sudo apt update;

# Clear screen, I don't want filthy logs
clear;

# Install Budgie Desktop Environment
sudo apt install gdm3 wget curl budgie-desktop synaptic gnome-tweaks tilix nemo;

# Enable Display Manager
sudo systemctl enable gdm3;

sudo systemctl start gdm3;

clear;

# Install some graphics to make budgie look better
sudo apt install arc-theme moka-icon-theme obsidian-icon-theme

# Purge Firefox, install Chromium:

sudo apt purge firefox -yy
sudo apt purge firefox-locale-en -yy
if [ -d "/home/$USER/.mozilla" ]; then
    rm -rf /home/$USER/.mozilla
fi
if [ -d "/home/$USER/.cache/mozilla" ]; then
    rm -rf /home/$USER/.cache/mozilla
fi

sudo apt install chromium

# Fix intel wireless chipset settings
echo "options iwlwifi bt_coex_active=0 swcrypto=1 11n_disable=8" | sudo tee /etc/modprobe.d/iwlwifi11n.conf
