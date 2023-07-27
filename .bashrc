/*******************************************************************
* Copyright         : 2023 Andranik Grigoryan
* File Name         : .bashrc
* Description       : bash configuration main file  
*                    
* Revision History  : v1
* ------------------------------------------------------------------
* 07/11/2014	Andranik Grigoryan	file main content added. 
*
/******************************************************************/

#!/bin/sh 

#================ Global configuratios =========================
#
# bash history configs 
HISTSIZE=500
HISTFILESIZE=5000
HISTTIMEFORMAT='%F, %T ' # Setting history output gormat as 'y-m-d h-m-s <command>'
shopt -s histappend  # Setting to append all sesion commands to histfile instead of overwriting it 
PROMPT_COMMAND='history -a' # Setting to append command to histfile after execution (by default it appends after session ended)
HISTCONTROL = ignorespace:ignoredups # Eliminate duplicates and spaces from the whole list
HISTIGNORE="history:ls:pwd:" # Ignoring ls pwd and history commands 

