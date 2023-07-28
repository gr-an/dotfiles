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

# Prompt setup
GREEN='\033[0;32m'
WHITE='\033[0;37m' 
RED='\033[0;31m'

# Installing figlet for prompt
sudo apt install -y figlet &> /dev/null

if [ $? -eq 0 ]; then 
  echo -e "${WHITE}[figlet] => ${GREEN}Installed successfully! "
else 
  echo -e "${WHITE}[figlet] => ${RED}Error while installing package"
fi

# Installing lolcat for prompt 
sudo apt install lolcat -y &> /dev/null 

if [ $? -eq 0 ]; then
  echo -e "${WHITE}[lolcat] => ${GREEN}Installed successfully! "
else 
  echo -e "${WHITE}[lolcat] => ${REDC}Error while installing package"
fi 


# Installing git completion script 
sudo apt install git-core bash-completion &> /dev/null

if [ $? -eq 0 ]; then 
  echo -e "${WHITE}[git completion] => ${GREEN}Installed successfully!"
else
  echo -e "${WHITE}[git completion] => ${RED}Error while installing package"
fi

# Installing exa for 'l' command aliases
sudo apt install exa -y &> /dev/null
if [ $? -eq 0 ]; then
  echo -e "${WHITE}[exa] => ${GREEN}Installed successfully!"
else
  echo -e "${WHITE}[exa] => ${GREEN}Error while installing package"
fi

# Colorized diff output package
sudo apt install -y colordiff &> /dev/null
if [ $? -eq 0 ]; then 
  echo -e "${WHITE}[colordiff] ${GREEN}Installed successfully"
else
  echo -e "${WHITE}[colordiff] ${RED}Eroor while installing package"
fi

# Installing python3-venv for if lsp-python server needed
sudo apt install -y python3-venv &> /dev/null
if [ $? -eq 0 ]; then 
  echo -e "${WHITE}[python3-venv] ${GREEN}Installed successfully"
else
  echo -e "${WHITE}[python3-venv] ${RED}Eroor while installing package"
fi

# Installing ripgrep
sudo apt install -y ripgrep &> /dev/null
if [ $? -eq 0 ]; then 
  echo -e "${WHITE}[ripgrep] ${GREEN}Installed successfully"
else
  echo -e "${WHITE}[ripgrep] ${RED}Eroor while installing package"
fi


