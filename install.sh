#!/bin/sh

echo "installing..."

echo "installing oh-my-zsh..."
[ -d ~/.oh-my-zsh ] || git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
[ -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ] || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
[ -d ~/.oh-my-zsh/custom/plugins/deepx ] || git clone git@github.com:GetAmbush/deepx-zsh-plugin.git ~/.oh-my-zsh/custom/plugins/deepx
[ -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ] || git clone git@github.com:zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
echo "oh-my-zsh installed"

echo "installing homebrew..."
[ ! -f "$(command -v brew)" ] && /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo "homebrew installed"

brew bundle

echo "symlinking dotfiles..."
ln -sf "$(pwd)"/vim/.vimrc ~/.vimrc
ln -sf "$(pwd)"/git/.gitconfig ~/.gitconfig
ln -sf "$(pwd)"/git/.gitignore_global ~/.gitignore_global
ln -sf "$(pwd)"/git/.git_commit_msg.txt ~/.git_commit_msg.txt
ln -sf "$(pwd)"/git/.git-authors ~/.git-authors
ln -sf "$(pwd)"/zsh/.zshrc ~/.zshrc
ln -sf "$(pwd)"/kitty/kitty.conf ~/.config/kitty
ln -sf "$(pwd)"/kitty/snazzy.conf ~/.config/kitty
echo "files symlinked"

chsh -s "$(command -v zsh)"
