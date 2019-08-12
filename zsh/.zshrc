# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git asdf zsh-syntax-highlighting zsh-autosuggestions deepx)

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

function setwp() {
    sqlite3 ~/Library/Application\ Support/Dock/desktoppicture.db "update data set value = '$1'" && killall Dock
}

function format() {
    git diff --name-only | grep -e '\(.*\).swift$' | while read line; do
        swiftformat $line;
        # git add $line;
    done
}

# Android vars

export ANDROID_HOME=~/Library/Android/sdk
export NDK_HOME=$ANDROID_HOME/ndk-bundle
export PATH=$PATH:$ANDROID_HOME
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$NDK_HOME

alias dps='docker ps'
alias dkup='docker compose up -d'
alias dall='docker kill $(docker ps -q)'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias prettyjson="python -m json.tool"
alias kf="killall Finder"
alias bearch="cd ~/Development/deepx"
alias proj="cd ~/Development/proj"
alias wpoa="curl -4 'http://wttr.in/Porto+Alegre'"
alias rw="networksetup -setairportpower en0 off && networksetup -setairportpower en0 on"
alias cat="ccat"
alias nuke="g co . && g boom && g reset --hard"
alias p="bundle exec pod"
alias f="bundle exec fastlane"
alias weather="curl -4 'http://wttr.in/Porto+Alegre'"
alias moon="curl -4 'http://wttr.in/Moon'"
alias be="cd ~/Development/deepx/brokerage-engine"

  export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion