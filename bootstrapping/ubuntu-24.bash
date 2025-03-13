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

sudo apt install -y curl stow unzip zsh

# Ensure home directory structure
mkdir -p ~/.local/{bin,tmp}

# Dotfiles
git clone git@github.com:ndxbn/dotfiles.git ~/dotfiles
pushd ~/dotfiles
./INSTALL.sh
popd

# Install Homebrew and insatll some cli tools via brew
git clone https://github.com/Homebrew/brew ~/.brew

~/.brew/bin/brew install gh ghq tig peco jq

# some envs
## Bun
## `brew tap oven/bun && brew install bun` has some issue.
## e.g. https://github.com/oven-sh/bun/issues/5075#issuecomment-2275474405
curl -fsSL https://bun.sh/install | bash
ln -s ~/.bun/bin/bun ~/.local/bin/bun
## PHP
## `brew install php` is so slowly because it does compile.
## `phpenv` is so slowly too.
curl -fsSL https://php.new/install/linux | bash
ln -s  ~/.config/herd-lite/bin/php ~/.local/bin/php
ln -s  ~/.config/herd-lite/bin/composer ~/.local/bin/composer
ln -s  ~/.config/herd-lite/bin/laravel ~/.local/bin/laravel
## zplug
git clone https://github.com/zplug/zplug ~/.zplug
## anyenv
git clone https://github.com/anyenv/anyenv ~/.anyenv
~/.anyenv/bin/anyenv init
~/.anyenv/bin/anyenv install --force-init
mkdir -p ~/.anyenv/plugins
git clone https://github.com/znz/anyenv-update.git ~/.anyenv/plugins/anyenv-update
~/.anyenv/bin/anyenv install nodenv
## aws-cli
if [[ -z $(type aws) ]]
then
	curl "https://awscli.amazonaws.com/awscli-exe-linux-$(uname -m).zip" -o "awscliv2.zip"
	unzip awscliv2.zip
	./aws/install -i /home/ndxbn/.local/aws-cli -b /home/ndxbn/.local/bin
else
	aws --version
fi

## JetBrains Toolbox Dependencies
sudo apt install libfuse2 libxi6 libxrender1 libxtst6 mesa-utils libfontconfig libgtk-3-bin tar dbus-user-session

