# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME=powerlevel10k/powerlevel10k

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

# User configuration

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/homebrew/bin:/Users/daniel/.rbenv/shims"

source $ZSH/oh-my-zsh.sh

function extract() {
    if [ -f "$1" ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf "$1"     ;;
            *.tar.gz)    tar xvzf "$1"     ;;
            *.bz2)       bunzip2 "$1"      ;;
            *.rar)       unrar x "$1"      ;;
            *.gz)        gunzip "$1"       ;;
            *.tar)       tar xvf "$1"      ;;
            *.tbz2)      tar xvjf "$1"     ;;
            *.tgz)       tar xvzf "$1"     ;;
            *.zip)       unzip "$1"        ;;
            *.Z)         uncompress "$1"   ;;
            *.7z)        7z x "$1"         ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

function format() {
    git diff --name-only | grep -e '\(.*\).swift$' | while read -r line; do
        swiftformat "$line";
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
export LANG=en_US.UTF-8


alias dps='docker ps'
alias dkup='docker compose up -d'
alias dall='docker kill $(docker ps -q)'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias prettyjson="python -m json.tool"
alias kf="killall Finder"
alias deepx="cd ~/Development/deepx"
alias misc="cd ~/Development/misc"
alias wpoa="curl -4 'http://wttr.in/Porto+Alegre'"
alias rw="networksetup -setairportpower en0 off && networksetup -setairportpower en0 on"
alias cat="ccat"
alias nuke="g co . && g boom && g reset --hard"
alias p="bundle exec pod"
alias f="bundle exec fastlane"
alias weather="curl -4 'http://wttr.in/Porto+Alegre'"
alias moon="curl -4 'http://wttr.in/Moon'"
alias jira='open https://truecaller.atlassian.net/browse/$(git rev-parse --abbrev-ref HEAD | sed "s/^feature\///")'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
