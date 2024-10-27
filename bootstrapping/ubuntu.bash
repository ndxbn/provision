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

git clone https://github.com/Homebrew/brew ~/.brew

~/.brew/bin/brew install gh ghq peco jq
