#!/bin/bash

# Mise à jour du système
apt update
apt upgrade -y
apt autoremove -y

# Vérification des messages relatifs à la sécurité
security_updates=$(apt list --upgradable 2>/dev/null | grep -c 'security')

if [ $security_updates -gt 0 ]; then
    # Envoyer une notification via ntfy
    ntfy -t "Mises à jour de sécurité disponibles" send "Il y a $security_updates mises à jour de sécurité disponibles sur votre système."
fi