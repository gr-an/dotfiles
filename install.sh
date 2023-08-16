#*******************************************************************
# Copyright         : 2023 Andranik Grigoryan
# File Name         : install.sh
# Description       : Automation for installing configuration files 
#                    
# Revision History  : v1
# ------------------------------------------------------------------
# 07/11/2014	Andranik Grigoryan	
#
#******************************************************************/

#!/bin/bash

# Update package list and upgrade packages
sudo apt update
sudo apt upgrade -y

# Install essential tools
sudo apt install -y git curl wget vim neovim

# Install Docker
sudo apt install -y docker.io
sudo usermod -aG docker $USER

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Install Python and pip
sudo apt install -y python3 python3-pip

# Install Ansible
sudo apt install -y ansible

# Install Terraform
TERRAFORM_VERSION="0.14.7"  # Replace with the desired version
wget "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
unzip "terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
sudo mv terraform /usr/local/bin/
rm "terraform_${TERRAFORM_VERSION}_linux_amd64.zip"

# Install Node.js and npm
curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt install -y nodejs

# Install AWS CLI
sudo apt install -y awscli

# Install kubectl
sudo snap install kubectl --classic

# Install minikube for local Kubernetes development
curl -LO "https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64"
sudo install minikube-linux-amd64 /usr/local/bin/minikube
rm minikube-linux-amd64

# Install Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

# Install PyCharm Community Edition
sudo snap install pycharm-community --classic

# Install Go
sudo apt install -y golang

# Install JetBrains IDEs (IntelliJ IDEA and WebStorm)
sudo snap install intellij-idea-community --classic
sudo snap install webstorm --classic

# Install Visual Studio Code
sudo snap install code --classic

# Create a Python virtual environment
sudo apt install -y python3-venv
python3 -m venv myenv

# Install K9s for Kubernetes management
sudo snap install k9s

# Clean up
sudo apt autoremove -y
sudo apt clean

# Set up automatic wallpaper changer
mkdir ~/Wallpapers
curl -o ~/Wallpapers/wallpaper.jpg "URL_TO_YOUR_WALLPAPER_IMAGE"

# Install and set up wallpaper changer script
sudo apt-get install feh
echo "#!/bin/bash" > ~/change_wallpaper.sh
echo "feh --randomize --bg-fill ~/Wallpapers/*" >> ~/change_wallpaper.sh
chmod +x ~/change_wallpaper.sh

# Add wallpaper changer script to startup applications
echo "[Desktop Entry]" > ~/.config/autostart/change_wallpaper.desktop
echo "Type=Application" >> ~/.config/autostart/change_wallpaper.desktop
echo "Exec=/home/yourusername/change_wallpaper.sh" >> ~/.config/autostart/change_wallpaper.desktop
echo "Hidden=false" >> ~/.config/autostart/change_wallpaper.desktop
echo "NoDisplay=false" >> ~/.config/autostart/change_wallpaper.desktop
echo "X-GNOME-Autostart-enabled=true" >> ~/.config/autostart/change_wallpaper.desktop
echo "Name[en_US]=Change Wallpaper" >> ~/.config/autostart/change_wallpaper.desktop
echo "Name=Change Wallpaper" >> ~/.config/autostart/change_wallpaper.desktop
echo "Comment[en_US]=Automatically changes the wallpaper" >> ~/.config/autostart/change_wallpaper.desktop
echo "Comment=Automatically changes the wallpaper" >> ~/.config/autostart/change_wallpaper.desktop

# Install Kitty terminal emulator
sudo apt-get update
sudo apt-get install kitty

# Set Kitty as the default terminal
sudo update-alternatives --config x-terminal-emulator
# Choose the number corresponding to Kitty in the list

# Install Oh My Zsh
sudo apt-get install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Set Zsh as the default shell
chsh -s $(which zsh)

# Configure Zsh plugins and theme (change as desired)
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/' ~/.zshrc
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc

# Install Zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Restart the shell to apply changes
exec zsh