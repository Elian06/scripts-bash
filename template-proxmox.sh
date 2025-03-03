#!/bin/bash

GREEN="32"
LIGHTCYAN="96"
BOLDGREEN="\e[1;${GREEN}m"
BOLDLIGHTCYAN="\e[1;${LIGHTCYAN}m"
ENDCOLOR="\e[0m"

template_id=$1
template_name=$2
cloudinit_img=$3 
storage="Datastore" # De base local-lvm | local-btrs | local-zfs | local

# Personnalisation Cloud-init | Intéractif
echo -e "${BOLDGREEN}Veuillez saisir le nom d'utilisateur pour Cloud-init:${ENDCOLOR}"
read -p "> " ci_username

echo -e "${BOLDGREEN}Veuillez saisir le mot de passe pour Cloud-init:${ENDCOLOR}"
read -s -p "> " ci_password
echo

ci_network="dhcp"

# Personnalisation Cloud-init
# ci_username="cloudinit"
# ci_password="changeme"
# ci_network="dhcp"

# Création de la VM
echo -e "\n${BOLDGREEN}Création de la MV${ENDCOLOR}" && sleep 2
qm create $template_id --memory 2048 --core 2 --name $template_name --net0 virtio,bridge=vmbr0 --agent 1,fstrim_cloned_disks=1 --tablet 0

# Import disque cloud-init
echo -e "\n${BOLDGREEN}Import image Cloud-INIT${ENDCOLOR}" && sleep 2
qm importdisk $template_id $cloudinit_img Datastore

# Création disque de stockage
echo -e "\n${BOLDGREEN}Création du disque de stockage${ENDCOLOR}" && sleep 2
qm set $template_id --scsihw virtio-scsi-pci --scsi0 Datastore:$template_id/vm-$template_id-disk-0.raw,discard=on,ssd=1

# Activation cloud-init
echo -e "\n${BOLDGREEN}Activation de Cloud-INIT${ENDCOLOR}" && sleep 2
qm set $template_id --ide2 $storage:cloudinit

# Mise en place du boot sur cloud-init
echo -e "\n${BOLDGREEN}Choix du boot${ENDCOLOR}" && sleep 2
qm set $template_id --boot c --bootdisk scsi0

# Mise en place serial vga obligatoire pour cloud-init
echo -e "\n${BOLDGREEN}Mise en place du serial vga obligatoire${ENDCOLOR}" && sleep 2
qm set $template_id --serial0 socket --vga serial0

# Paramètres cloud-init
echo -e "\n${BOLDGREEN}Initialisation paramètres Cloud-INIT${ENDCOLOR}" && sleep 2
qm set $template_id -ciuser $ci_username
qm set $template_id -cipassword $ci_password
qm set $template_id --ipconfig0 ip=$ci_network

# Création template
echo -e "\n${BOLDGREEN}Transformation de la VM en template${ENDCOLOR}" && sleep 2
qm template $template_id

# Fin du script
echo -e "\n${BOLDLIGHTCYAN}Template ${2} terminé${ENDCOLOR}\n"