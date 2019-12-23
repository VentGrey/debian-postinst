#!/usr/bin/env bash

# Yes bash, will be the default shell

dpkg -l | grep -qw gdebi || sudo apt install -yyq gdebi

# Update repositories

sudo apt update
