#*******************************************************************
# Copyright         : 2023 Andranik Grigoryan
# File Name         : prerequisuit.sh
# Description       : shell script to install all configuration needed tools  
#                    
# Revision History  : v1
# ------------------------------------------------------------------
# 07/11/2014	Andranik Grigoryan	tools for prompt generation. 
#
#******************************************************************/

#!/bin/sh 

# Installing figlet for prompt
sudo apt install -y figlet > /dev/null

if [ $? -eq 0 ]; then 
  echo "[figlet] => Installed successfully! "
else 
  echo "[figlet] => Error while installing package"
fi

# Installing git completion script 
sudo apt-get install git-core bash-completion > /dev/null

if [ $? -eq 0 ]; then 
  echo "[git completion] => Installed successfully!"
else
  echo "[git completion] => Error while installing package"
fi
