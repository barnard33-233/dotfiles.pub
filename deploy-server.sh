#!/bin/bash

dotfiles=`pwd`

echo "making links"

# echo $dotfiles

# git configuration
ln -s $dotfiles/gitconfig ~/.gitconfig
ln -s $dotfiles/gitignore_global ~/.gitignore_global

# vim
ln -s $dotfiles/vimrc ~/.vimrc

# neovim
ln -s $dotfiles/nvim ~/.config/

# alacritty
# ln -s $dotfiles/alacritty ~/.config/alacritty

# zellij
# ln -s $dotfiles/zellij ~/.config/zellij

# fish
ln -s $dotfiles/fish/completions ~/.config/fish/
ln -s $dotfiles/fish/conf.d ~/.config/fish/
ln -s $dotfiles/fish/config.fish ~/.config/fish/config.fish
ln -s $dotfiles/fish/functions ~/.config/fish/

# ibus-rime
# ln -s $dotfiles/luna_pinyin.custom.yaml ~/.config/ibus/rime/luna_pinyin.custom.yaml

