#!/bin/sh

[ -d ~/.oh-my-zsh ] || git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh 

ln -sf $(pwd)/vim/.vimrc ~/.vimrc
ln -sf $(pwd)/git/.gitconfig ~/.gitconfig
ln -sf $(pwd)/git/.gitignore_global ~/.gitignore_global
ln -sf $(pwd)/git/.git_commit_msg.txt ~/.git_commit_msg.txt
ln -sf $(pwd)/git/.git-authors ~/.git-authors
ln -sf $(pwd)/zsh/.zshrc ~/.zshrc
