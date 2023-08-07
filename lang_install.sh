#!/bin/bash

echo "Hello, $USER! Python3, Rust, Golang will be install now."

echo "Installing Python3"
sudo apt install -y python3 python3-pip python3-venv

echo

echo "Installing Rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env"
rustup check

echo

echo "Installing Golang"
cd /tmp
wget https://go.dev/dl/go1.20.7.linux-amd64.tar.gz
sudo rm -rf /usr/local/go; sudo tar -C /usr/local -xzf go*.tar.gz

echo '\n\n# For golang binaries' >> ~/.zshrc
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.zshrc
echo 'export PATH=$PATH:$HOME/go/bin' >> ~/.zshrc
source ~/.zshrc
rm go*.tar.gz
cd ~/
go version

echo "Thank you for using my tool!"
echo "Github link: https://github.com/szybnev/SysOps"
