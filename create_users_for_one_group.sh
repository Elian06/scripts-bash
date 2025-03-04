#!/bin/bash

# Demander le nom du groupe
read -p "Entrez le nom du groupe à créer : " group_name

# Vérifier si le groupe existe déjà
if getent group "$group_name" > /dev/null 2>&1; then
    echo "Le groupe '$group_name' existe déjà."
else
    # Créer le groupe
    sudo groupadd "$group_name"
    echo "Groupe '$group_name' créé avec succès."
fi

# Demander le nombre d'utilisateurs à créer
read -p "Combien d'utilisateurs voulez-vous créer ? " user_count

# Vérifier si l'entrée est un nombre valide
if ! [[ "$user_count" =~ ^[0-9]+$ ]]; then
    echo "Erreur : Veuillez entrer un nombre valide."
    exit 1
fi

# Boucle pour créer les utilisateurs
for ((i = 1; i <= user_count; i++)); do
    read -p "Entrez le nom du nouvel utilisateur #$i : " user_name
    
    # Vérifier si l'utilisateur existe déjà
    if id "$user_name" &>/dev/null; then
        echo "L'utilisateur '$user_name' existe déjà. Il sera ajouté au groupe '$group_name'."
    else
        # Créer l'utilisateur
        sudo useradd -m -g "$group_name" "$user_name"
        echo "Utilisateur '$user_name' créé et ajouté au groupe '$group_name'."
    fi

    # Ajouter l'utilisateur au groupe (si ce n'est pas déjà fait)
    sudo usermod -aG "$group_name" "$user_name"
done

echo "Opération terminée !"
