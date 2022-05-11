#!/usr/bin/env bash

set -e

# install cargo
curl https://sh.rustup.rs -sSf | sh

# install cargo related app
# replacement for ls
cargo install exa

# install starship
curl -sS https://starship.rs/install.sh | sudo sh

# setup starship config
mkdir ~/.config
cp starship.toml ~/.config/

# install zsh plugin
mkdir ~/.zsh
cd ~/.zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone https://github.com/zsh-users/zsh-autosuggestions

# update zshrc
echo '
alias ls=exa

eval "$(starship init zsh)"
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
' >> ~/.zshrc

