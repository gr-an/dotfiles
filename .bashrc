#*******************************************************************
# Copyright         : 2023 Andranik Grigoryan
# File Name         : .bashrc
# Description       : bash configuration main file  
#                    
# Revision History  : v1
# ------------------------------------------------------------------
# 07/11/2014	Andranik Grigoryan	file main content added. 
#
#******************************************************************/

#!/bin/sh 

#================ Global configuratios =========================
#
# Global variables setup
EDITOR=nvim
#
# bash history configs 
HISTSIZE=500
HISTFILESIZE=5000
HISTTIMEFORMAT='%F, %T ' # Setting history output gormat as 'y-m-d h-m-s <command>'
shopt -s histappend  # Setting to append all sesion commands to histfile instead of overwriting it 
PROMPT_COMMAND='history -a' # Setting to append command to histfile after execution (by default it appends after session ended)
HISTCONTROL=ignorespace:ignoredups # Eliminate duplicates and spaces from the whole list
HISTIGNORE="history:ls:pwd:" # Ignoring ls pwd and history commands 

#================ Bash prompt configuration =====================
#
# Running beautifull prompt on terminal opening 
figlet -s Grigoryan | lolcat
echo -e "This shit is going real! \n" | lolcat


# Prompt generation 
define_prompt() {
  Last_command=$? # Last runned command result 
  ## Styles definition
  Red='\[\e[01;31m\]'
  Green='\[\e[01;32m\]'
  Reset='\[\e[00m\]'
  FancyX='\342\234\227'
  Checkmark='\342\234\223'  

  # Checking last command success for checkmark color definition 
  PS=""
  if [ Last_command == 0 ]; then
    PS+="$Green$Checkmark"
  else 
    PS+="$Red$Checkmark"
  fi


}

