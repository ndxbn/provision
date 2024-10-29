#!/usr/bin/env bash
set -eu
sudo apt update && sudo apt upgrade -y
sudo apt install -y python3-venv python3-pip

sudo locale-gen en_US.UTF-8
sudo localectl set-locale LANG=en_US.UTF-8
sudo localectl set-locale LANGUAGE=en_US.UTF-8

# under here, these should move to playbook.
sudo apt install -y openssh-server
sudo systemctl start ssh
sudo systemctl enable ssh

sudo apt install -y stow unzip zsh

# Ensure home directory structure
mkdir -p ~/.local/{bin,tmp}

## ssh key
mkdir -p ~/.ssh 
chmod 700 ~/.ssh
cat /mnt/c/Users/ndxbn/.ssh/id_ed25519 > ~/.ssh/id_ed25519
chmod 600 ~/.ssh/id_ed25519

# Dotfiles
git clone git@github.com/ndxbn/dotfiles.git ~/dotfiles
pushd ~/dotfiles
./INSTALL.sh
popd

# Install Homebrew and insatll some cli tools via brew
git clone https://github.com/Homebrew/brew ~/.brew

~/.brew/bin/brew install gh ghq peco jq

# some envs
## Deno
curl -fsSL https://deno.land/install.sh | sh
ln -s ~/.deno/bin/deno ~/.local/bin/deno
## Bun
curl -fsSL https://bun.sh/install | bash
ln -s ~/.bun/bin/bun ~/.local/bin/bun
## zplug
git clone https://github.com/zplug/zplug ~/.zplug
## anyenv
git clone https://github.com/anyenv/anyenv ~/.anyenv
~/.anyenv/bin/anyenv init
~/.anyenv/bin/anyenv install --force-init
mkdir -p ~/.anyenv/plugins
git clone https://github.com/znz/anyenv-update.git ~/.anyenv/plugins/anyenv-update
~/.anyenv/bin/anyenv install nodenv

