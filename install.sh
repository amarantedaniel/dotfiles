#!/usr/bin/env bash

set -o errexit -o pipefail -o nounset

echo "installing..."

echo "installing oh-my-zsh..."
[ -d ~/.oh-my-zsh ] || git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
[ -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ] || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
[ -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ] || git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
[ -d ~/.oh-my-zsh/custom/themes/powerlevel10k ] || git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
echo "oh-my-zsh installed"

echo "installing homebrew..."
[ ! -f "$(command -v brew)" ] && /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo "homebrew installed"

brew bundle

echo "symlinking dotfiles..."
ln -sf "$(pwd)"/vim/.vimrc ~/.vimrc
ln -sf "$(pwd)"/git/.gitconfig ~/.gitconfig
ln -sf "$(pwd)"/git/.gitignore_global ~/.gitignore_global
ln -sf "$(pwd)"/zsh/.zshrc ~/.zshrc
ln -sf "$(pwd)"/zsh/.zshenv ~/.zshenv

mkdir -p ~/Library/Application\ Support/Code/User
ln -sf "$(pwd)"/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json

mkdir -p ~/.config/ghostty
ln -sf "$(pwd)"/ghostty/config ~/.config/ghostty/config

mkdir -p ~/.config/gh
ln -sf "$(pwd)"/gh/config.yml ~/.config/gh/config.yml

mkdir -p ~/.config/mise
ln -sf "$(pwd)"/mise/config.toml ~/.config/mise/config.toml

mkdir -p ~/.claude
ln -sf "$(pwd)"/agents/AGENTS.md ~/.claude/CLAUDE.md

mkdir -p ~/.codex
ln -sf "$(pwd)"/agents/AGENTS.md ~/.codex/AGENTS.md
echo "files symlinked"

echo "importing iTerm color scheme..."
open "$(pwd)"/iterm/Everforest.itermcolors

[ "$SHELL" != "$(command -v zsh)" ] && chsh -s "$(command -v zsh)"
