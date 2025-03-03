#!/bin/bash

# Define color codes
GREEN='\033[0;32m'
RED='\033[0;31m'
RESET='\033[0m' # No Color

# Packages list
packages=(
    "exa"         # Better than ls
    "bat"         # Better than cat
    "btop"        # Betther than top
    "ncdu"        # Better than du -h
    "duf"         # Better than df -h
    "neofetch"    # Because it's cool
    "git"         # Because git
)

# Packages installation
clear
echo "Mise à jour de la liste des paquets..."
echo " "
sudo apt update >/dev/null 2>&1
echo "Installation des paquets :"
for package in "${packages[@]}"; do
    if sudo NEEDRESTART_MODE=a apt install "$package" -y >/dev/null 2>&1; then
        echo -e "  - Installation de $package : ${GREEN}ok${RESET}"
    else
        echo -e "  - Installation de $package : ${RED}échoué${RESET}"
    fi
done