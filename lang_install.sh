#!/bin/bash

printf "Hello, $USER! Python3, Rust, Golang will be install now."

echo "Installing Python3"
sudo apt install -y python3 python3-pip python3-venv

echo

echo "Installing Rust"
echo "You need to press Enter"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
rustup check

echo

echo "Installing Golang"
cd /tmp
wget https://go.dev/dl/go1.20.6.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.20.6.linux-amd64.tar.gz
echo '' >>  ~/.profile
echo '# For golang binaries' >> ~/.profile
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.profile
echo 'export PATH=$PATH:$HOME/go/bin' >> ~/.profile
source $HOME/.profile
rm go*.tar.gz
cd ~/
go version

echo "Thank you for using my tool!"
echo "Github link: https://github.com/szybnev/SysOps"
