#!/bin/bash

printf "Enter your ssh publickey: "
read SSHKEY

apt-get clean; apt-get update; apt-get full-upgrade -y; apt-get autoremove -y; apt-get install curl build-essential wget git fzf zsh traceroute exa bat zip unzip ripgrep ; apt-get clean  &&  rm -rf /var/lib/apt/lists/*; echo "$SSHKEY" > ~/.ssh/authorized_keys

printf "Do you want to reboot [Y/N]: "
read ANSWR

if [[ $ANSWR = "Y" ]] || [[ $ANSWR = "y" ]]
then 
  reboot
else
  echo "Canceled reboot"
