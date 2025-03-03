#!/bin/bash

# Vérification des paramètres
if [ -z "$1" ]; then
    echo "Usage: $0 <image> [ports]"
    exit 1
fi

IMAGE=$1
read -p "Entrez le nom du conteneur : " CONTAINER_NAME
PORTS=${2:-""}

# Vérification si le conteneur existe déjà
if docker ps -a --format '{{.Names}}' | grep -q "^$CONTAINER_NAME$"; then
    echo "Un conteneur avec le nom $CONTAINER_NAME existe déjà."
    exit 1
fi

# Construction de la commande de lancement
RUN_CMD="docker run -d --name $CONTAINER_NAME"
if [ -n "$PORTS" ]; then
    for port in $PORTS; do
        RUN_CMD+=" -p $port:$port"
    done
fi
RUN_CMD+=" $IMAGE"

# Exécution de la commande
echo "Déploiement du conteneur..."
eval $RUN_CMD

# Affichage des informations du conteneur
docker ps --filter "name=$CONTAINER_NAME"