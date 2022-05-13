#!/bin/bash

sudo apt-get install xclip

git clone https://github.com/helix-editor/helix
pushd helix > /dev/null

cargo build --release
sudo cp ./target/release/hx /usr/bin/

sudo /usr/bin/hx --grammar fetch
sudo /usr/bin/hx --grammar build

rm -rf runtime/grammars
sudo cp runtime/* /usr/bin/runtime/

popd > /dev/null
rm -rf helix

mkdir -p ~/.config/helix
cp config.toml ~/.config/helix/

