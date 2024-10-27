#!/usr/bin/env bash
set -eu
sudo apt install python3-venv python3-pip

sudo locale-gen en_US.UTF-8
localectl LANG=en_US.UTF-8
lcoalectl LANGUAGE=en_US.UTF-8

# under here, these should move to playbook.
sudo apt install openssh-server
sudo systemctl start ssh
sudo systemctl enable ssh

sudo apt install \
	jq

## GitHub CLI
(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
	&& sudo mkdir -p -m 755 /etc/apt/keyrings \
	&& sudo wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& sudo apt update \
	&& sudo apt install gh -y
