#!/bin/bash

# Mettre à jour la liste des paquets
if ! apt-get update -y; then
    echo "Erreur lors de la mise à jour de la liste des paquets" | ntfy -t "Mise à jour quotidienne"
    exit 1
fi

# Mettre à jour les paquets installés
if ! apt-get upgrade -y; then
    echo "Erreur lors de la mise à jour des paquets installés" | ntfy -t "Mise à jour quotidienne"
    exit 1
fi

# Mettre à jour la distribution
if ! apt-get dist-upgrade -y; then
    echo "Erreur lors de la mise à jour de la distribution" | ntfy -t "Mise à jour quotidienne"
    exit 1
fi

# Nettoyer les paquets inutilisés
apt-get autoremove -y
apt-get clean

# Vérifier les mises à jour de sécurité
if ! unattended-upgrade -d --dry-run | grep -q "No packages found that can be upgraded unattended and no pending auto-removals"; then
    echo "Des mises à jour de sécurité sont disponibles, veuillez vous en occuper" | ntfy -t "Mise à jour de sécurité"
    exit 1
fi

echo "Mises à jour quotidiennes effectuées avec succès" | ntfy -t "Mise à jour quotidienne"
exit 0