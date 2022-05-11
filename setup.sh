#!/usr/bin/env bash

set -e

# install cargo
curl https://sh.rustup.rs -sSf | sh

# install cargo related app
# replacement for ls
cargo install exa
# cat
cargo install bat
# find
cargo install fd-find
# cd
cargo install zoxide

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
alias cat=bat

eval "$(/usr/local/bin/starship init zsh)"
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(zoxide init zsh)"
' >> ~/.zshrc

