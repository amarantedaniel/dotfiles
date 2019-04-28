#!/bin/sh

echo "installing..."

echo "installing oh-my-zsh..."
[ -d ~/.oh-my-zsh ] || git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh 
[ -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ] || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
echo "oh-my-zsh installed"

echo "installing asdf..."
[ -d ~/.asdf ] || git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.4.2
echo "asdf installed"

echo "installing homebrew..."
[ ! -f "`which brew`" ] && /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo "homebrew installed"

echo "symlinking dotfiles..."
ln -sf $(pwd)/vim/.vimrc ~/.vimrc
ln -sf $(pwd)/git/.gitconfig ~/.gitconfig
ln -sf $(pwd)/git/.gitignore_global ~/.gitignore_global
ln -sf $(pwd)/git/.git_commit_msg.txt ~/.git_commit_msg.txt
ln -sf $(pwd)/git/.git-authors ~/.git-authors
ln -sf $(pwd)/zsh/.zshrc ~/.zshrc
echo "files symlinked"

chsh -s $(which zsh)

