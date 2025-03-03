#!/bin/bash

# Define colors
GREEN="\e[32m"
CYAN="\e[36m"
RESET="\e[0m"

# ASCII art
docker="${CYAN}
                      =++++                       
                      *####                       
                      -====                       
          .****:-****.=***+                       
          :####-=####.*####           :           
          .====.:==== -====          -##=         
     +***=.****:-****.=***+ ****=    ####*        
     ####*:####-=####.*#### ####+    *####*###*=  
     ====-.====.:==== -==== ====:    -########*.  
  -+++++++++++++++++++++++++++++++**#####==-:     
  =#####################################:         
  :###################################*.          
   *#################################=            
   .*##############################+.             
     +##########################*-                
      .=*####################+-.                  
         .-=+**######**+=-:.
${RESET}"

clear

echo -e "${docker}"
echo -e "${CYAN}Step 1: Add Docker's official GPG key${RESET}"
echo -e "Updating package list"
sleep 2
sudo apt-get update > .temp.log

clear
echo -e "${docker}"
echo -e "${CYAN}Step 1: Add Docker's official GPG key${RESET}"
echo -e "${GREEN}Updating package list${RESET}"
echo -e "Installing required packages: ca-certificates, curl, gnupg"
sleep 2
sudo apt-get install -y ca-certificates curl gnupg > .temp.log

clear
echo -e "${docker}"
echo -e "${CYAN}Step 1: Add Docker's official GPG key${RESET}"
echo -e "${GREEN}Updating package list${RESET}"
echo -e "${GREEN}Installing required packages: ca-certificates, curl, gnupg${RESET}"
echo -e "Creating directory /etc/apt/keyrings"
sleep 2
sudo install -m 0755 -d /etc/apt/keyrings

clear
echo -e "${docker}"
echo -e "${CYAN}Step 1: Add Docker's official GPG key${RESET}"
echo -e "${GREEN}Updating package list${RESET}"
echo -e "${GREEN}Installing required packages: ca-certificates, curl, gnupg${RESET}"
echo -e "${GREEN}Creating directory /etc/apt/keyrings${RESET}"
echo -e "Downloading Docker's GPG key and saving it to /etc/apt/keyrings/docker.gpg"
sleep 2
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

clear
echo -e "${docker}"
echo -e "${CYAN}Step 1: Add Docker's official GPG key${RESET}"
echo -e "${GREEN}Updating package list${RESET}"
echo -e "${GREEN}Installing required packages: ca-certificates, curl, gnupg${RESET}"
echo -e "${GREEN}Creating directory /etc/apt/keyrings${RESET}"
echo -e "${GREEN}Downloading Docker's GPG key and saving it to /etc/apt/keyrings/docker.gpg${RESET}"
echo -e "${CYAN}Step 2: Add the repository to Apt sources${RESET}"
echo -e "Adding the Docker repository to Apt sources"
sleep 2
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

clear
echo -e "${docker}"
echo -e "${CYAN}Step 1: Add Docker's official GPG key${RESET}"
echo -e "${GREEN}Updating package list${RESET}"
echo -e "${GREEN}Installing required packages: ca-certificates, curl, gnupg${RESET}"
echo -e "${GREEN}Creating directory /etc/apt/keyrings${RESET}"
echo -e "${GREEN}Downloading Docker's GPG key and saving it to /etc/apt/keyrings/docker.gpg${RESET}"
echo -e "${CYAN}Step 2: Add the repository to Apt sources${RESET}"
echo -e "${GREEN}Adding the Docker repository to Apt sources${RESET}"
echo -e "Updating package list with Docker repository"
sleep 2
sudo apt-get update > .temp.log

clear
echo -e "${docker}"
echo -e "${CYAN}Step 1: Add Docker's official GPG key${RESET}"
echo -e "${GREEN}Updating package list${RESET}"
echo -e "${GREEN}Installing required packages: ca-certificates, curl, gnupg${RESET}"
echo -e "${GREEN}Creating directory /etc/apt/keyrings${RESET}"
echo -e "${GREEN}Downloading Docker's GPG key and saving it to /etc/apt/keyrings/docker.gpg${RESET}"
echo -e "${CYAN}Step 2: Add the repository to Apt sources${RESET}"
echo -e "${GREEN}Adding the Docker repository to Apt sources${RESET}"
echo -e "${GREEN}Updating package list with Docker repository${RESET}"
echo -e "${CYAN}Step 3: Install Docker${RESET}"
echo -e "Installing Docker and related packages"
sleep 2
sudo NEEDRESTART_MODE=a apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin > .temp.log

clear
echo -e "${docker}"
echo -e "${CYAN}Step 1: Add Docker's official GPG key${RESET}"
echo -e "${GREEN}Updating package list${RESET}"
echo -e "${GREEN}Installing required packages: ca-certificates, curl, gnupg${RESET}"
echo -e "${GREEN}Creating directory /etc/apt/keyrings${RESET}"
echo -e "${GREEN}Downloading Docker's GPG key and saving it to /etc/apt/keyrings/docker.gpg${RESET}"
echo -e "${CYAN}Step 2: Add the repository to Apt sources${RESET}"
echo -e "${GREEN}Adding the Docker repository to Apt sources${RESET}"
echo -e "${GREEN}Updating package list with Docker repository${RESET}"
echo -e "${CYAN}Step 3: Install Docker${RESET}"
echo -e "${GREEN}Installing Docker and related packages${RESET}"
echo -e "Added $USER to Docker group"
sleep 2
sudo adduser $USER docker

clear
echo -e "${docker}"
echo -e "${CYAN}Step 1: Add Docker's official GPG key${RESET}"
echo -e "${GREEN}Updating package list${RESET}"
echo -e "${GREEN}Installing required packages: ca-certificates, curl, gnupg${RESET}"
echo -e "${GREEN}Creating directory /etc/apt/keyrings${RESET}"
echo -e "${GREEN}Downloading Docker's GPG key and saving it to /etc/apt/keyrings/docker.gpg${RESET}"
echo -e "${CYAN}Step 2: Add the repository to Apt sources${RESET}"
echo -e "${GREEN}Adding the Docker repository to Apt sources${RESET}"
echo -e "${GREEN}Updating package list with Docker repository${RESET}"
echo -e "${CYAN}Step 3: Install Docker${RESET}"
echo -e "${GREEN}Installing Docker and related packages${RESET}"
echo -e "${GREEN}Added $USER to Docker group${RESET}"
echo -e "${CYAN}Step 4: Verify Docker Installation${RESET}"
echo -e "Running a test container to verify Docker installation"
sudo docker run hello-world
sleep 2

clear
echo -e "${docker}"
echo -e "${CYAN}Step 1: Add Docker's official GPG key${RESET}"
echo -e "${GREEN}Updating package list${RESET}"
echo -e "${GREEN}Installing required packages: ca-certificates, curl, gnupg${RESET}"
echo -e "${GREEN}Creating directory /etc/apt/keyrings${RESET}"
echo -e "${GREEN}Downloading Docker's GPG key and saving it to /etc/apt/keyrings/docker.gpg${RESET}"
echo -e "${CYAN}Step 2: Add the repository to Apt sources${RESET}"
echo -e "${GREEN}Adding the Docker repository to Apt sources${RESET}"
echo -e "${GREEN}Updating package list with Docker repository${RESET}"
echo -e "${CYAN}Step 3: Install Docker${RESET}"
echo -e "${GREEN}Installing Docker and related packages${RESET}"
echo -e "${GREEN}Added $USER to Docker group${RESET}"
echo -e "${CYAN}Step 4: Verify Docker Installation${RESET}"
echo -e "${GREEN}Running a test container to verify Docker installation${RESET}"
sleep 1

sudo rm .temp.log

echo ""
echo -e "${CYAN}Docker installation and verification complete.${RESET}"
echo ""