#!/usr/bin/env bash
set -eu
apt install python3-venv python3-pip

## under here, these should move to playbook.
apt install openssh-server
sysetmctl start ssh
systemctl enable ssh

