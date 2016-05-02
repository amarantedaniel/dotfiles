# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin" 

source $ZSH/oh-my-zsh.sh

function extract() 
{ 
	if [ -f $1 ] ; then 
		case $1 in 
			*.tar.bz2)   tar xvjf $1     ;; 
			*.tar.gz)    tar xvzf $1     ;; 
			*.bz2)       bunzip2 $1      ;; 
			*.rar)       unrar x $1      ;; 
			*.gz)        gunzip $1       ;; 
			*.tar)       tar xvf $1      ;; 
			*.tbz2)      tar xvjf $1     ;; 
			*.tgz)       tar xvzf $1     ;; 
			*.zip)       unzip $1        ;; 
			*.Z)         uncompress $1   ;; 
			*.7z)        7z x $1         ;; 
			*)           echo "'$1' cannot be extracted via >extract<" ;; 
		esac 
	else 
		echo "'$1' is not a valid file!" 
	fi 
} 

#screen sharing
function pair() {
    COMPUTER_IP=$(dscacheutil -q host -a name $1.local | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')    
    open vnc://$COMPUTER_IP
}

eval "$(rbenv init -)"

# Postgres
export POSTGRES_HOME=/Applications/Postgres.app/Contents/Versions/9.5/bin
export PATH=$PATH:$POSTGRES_HOME

# Android vars
export ANDROID_HOME=~/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME
export PATH=$PATH:$ANDROID_HOME/platform-tools

alias prettyjson="python -m json.tool"
alias kf="killall Finder"
alias bearch="cd ~/Documents/bearch"
alias proj="cd ~/Documents/projects"
alias school="cd ~/Documents/school"