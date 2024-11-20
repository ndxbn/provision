#!/usr/bin/env bash
set -eu
# Ensure home directory structure
mkdir -p ~/.local/{bin,tmp}

# Dotfiles
git clone git@github.com/ndxbn/dotfiles.git ~/dotfiles
pushd ~/dotfiles
./INSTALL.sh
popd

# Install Homebrew and insatll some cli tools via brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
/opt/homebrew/bin/brew install gh ghq tig peco jq

# some envs
## Deno
## `brew install deno` is so slowly because it does compile.
curl -fsSL https://deno.land/install.sh | sh
ln -s ~/.deno/bin/deno ~/.local/bin/deno
## Bun
## `brew tap oven/bun && brew install bun` has some issue.
## e.g. https://github.com/oven-sh/bun/issues/5075#issuecomment-2275474405
curl -fsSL https://bun.sh/install | bash
ln -s ~/.bun/bin/bun ~/.local/bin/bun
## PHP
## `brew install php` is so slowly because it does compile.
## `phpenv` is so slowly too.
curl -fsSL https://php.new/install/mac | bash
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

