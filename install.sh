#!/bin/sh

if grep compProMode $HOME/.config/nvim/init.vim > /dev/null; then
	echo "CompProMode has been installed."
else
	echo "\"CompProMode\ncommand! Comp source $HOME/compProVim/execute.vim" >> $HOME/.config/nvim/init.vim
fi
