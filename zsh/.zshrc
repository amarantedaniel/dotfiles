# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git zsh-syntax-highlighting)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

source $ZSH/oh-my-zsh.sh

function extract() {
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
    if [[ $1 =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        open vnc://$1
    else
        COMPUTER_IP=$(dscacheutil -q host -a name $1.local | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')
        open vnc://$COMPUTER_IP
    fi
}

function setwp() {
    sqlite3 ~/Library/Application\ Support/Dock/desktoppicture.db "update data set value = '$1'" && killall Dock
}

function heckshot() {
    FILENAME=$1
    FILENAME="${FILENAME:-screenshot}"
    adb shell screencap -p /sdcard/$FILENAME.png
    adb pull /sdcard/$FILENAME.png $2
    adb shell rm /sdcard/$FILENAME.png
}

# Postgres
export POSTGRES_HOME=/Applications/Postgres.app/Contents/Versions/9.5/bin
export PATH=$PATH:$POSTGRES_HOME

# Android vars
export ANDROID_HOME=~/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/tools

alias prettyjson="python -m json.tool"
alias kf="killall Finder"
alias bearch="cd ~/Documents/bearch"
alias proj="cd ~/Documents/projects"
alias wpoa="curl -4 'http://wttr.in/Porto+Alegre'"
alias rw="networksetup -setairportpower en0 off && networksetup -setairportpower en0 on"
alias fixsim="rm ~/Library/Preferences/com.apple.iphonesimulator.plist"
alias birl="brew"
alias fixaudio="sudo killall coreaudiod"

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash
