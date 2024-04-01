#!/bin/bash

sudo apt update; sudo apt full-upgrade -y; sudo apt autoremove -y; sudo apt autoclean

echo Install ohmyzsh
sudo apt install -y zsh zip unzip git curl wget; echo Y | sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"; zsh

echo Configure ohmyzsh
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k; git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting; git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions; sed -i 's+robbyrussell+powerlevel10k/powerlevel10k+g' ~/.zshrc; sed -i 's+git+git zsh-syntax-highlighting zsh-autosuggestions+g' ~/.zshrc; sleep 1; clear; ; chsh -s /bin/zsh; source ~/.zshrc

echo Install docker, docker compose
curl -fsSL https://get.docker.com | sudo bash

echo Install golang
wget https://go.dev/dl/go1.22.1.linux-amd64.tar.gz; sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.22.1.linux-amd64.tar.gz; go version

echo "paste this in the end 
nano ~/.zshrc

# For go bins
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/go/bin"

# For py bins
export PATH="$PATH:/usr/local/bin/python"
"
