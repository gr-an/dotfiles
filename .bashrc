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
figlet -s test | lolcat
echo -e " SHITS ABOUT TO GET REAL! \n" | lolcat

# Function to get the current timestamp in seconds and nanoseconds
timer_now() {
    date +%s%N
}

# Function to start the timer
timer_start() {
    timer_start=${timer_start:-$(timer_now)}
}


# Function to stop the timer and calculate the elapsed time
timer_stop() {
    if [[ -z "$timer_start" ]]; then
        return
    fi
    
    local delta_us=$((($(timer_now) - $timer_start) / 1000))
    local us=$((delta_us % 1000))
    local ms=$(((delta_us / 1000) % 1000))
    local s=$(((delta_us / 1000000) % 60))
    local m=$(((delta_us / 60000000) % 60))
    local h=$((delta_us / 3600000000))
    
    # Goal: always show around 3 digits of accuracy
    if ((h > 0)); then
        timer_show=${h}h${m}m
    elif ((m > 0)); then
        timer_show=${m}m${s}s
    elif ((s >= 10)); then
        timer_show=${s}.$((ms / 100))s
    elif ((s > 0)); then
        timer_show=${s}.$(printf %03d $ms)s
    elif ((ms >= 100)); then
        timer_show=${ms}ms
    elif ((ms > 0)); then
        timer_show=${ms}.$((us / 100))ms
    else
        timer_show=${us}us
    fi
    
    unset timer_start
}

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
  if [[ $Last_command == 0 ]]; then
    PS+="$Green$Checkmark "
  else 
    PS+="$Red$FancyX "
  fi

  # Add the elapsed time and date
  timer_stop
  PS+="($timer_show)"

  # Print the working directory, Kubernetes context and namespace, and Git branch in the prompt
  PS1="$PS\[\033[38;5;87m\]\u\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;10m\]\[$(tput sgr0)\] [\[$(tput sgr0)\]\[\033[38;5;11m\]\w\[$(tput sgr0)\]] \[$(tput sgr0)\]\[\033[38;5;1m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;10m\]\\$\[$(tput sgr0)\]> \[$(tput sgr0)\]"
}

# Start timer when command was executed
trap 'timer_start' DEBUG
# Get generated promet from difine_prompt function 
PROMPT_COMMAND='define_prompt'

# Runnign aliases 
source ./.aliases

