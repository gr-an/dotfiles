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

# Running prerequisit script 
chmod +x prerequisit.sh
./prerequisit.sh

# Moving aliases file to users dir
cp .aliases ${HOME}/.aliases 

echo "Enter your name: " 
read name 

# Backing up current configs 
cp ${HOME}/.bashrc ${HOME}/.bashrc.back

# Copy new config to home whit changing prompt name 
sed -i "s/username/${name}/g" .bashrc 
cp .bashrc ${HOME}/.bashrc 

# Configuring neovim 
cp ./nvim ${HOME}/.config/nvim -r

echo "Done: Please restart your termianl"
