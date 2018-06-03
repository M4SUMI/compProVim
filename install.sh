#!/bin/sh
if ! grep XDG_CONFIG_HOME $HOME/.bashrc > /dev/null; then
	echo "export XDG_CONFIG_HOME=$HOME/.config" >> $HOME/.bashrc
	. $HOME/.bashrc
fi

if grep Comp $XDG_CONFIG_HOME/nvim/init.vim > /dev/null; then
	echo "CompProMode has been installed."
else
    echo "\"CompProMode"                              >> $XDG_CONFIG_HOME/nvim/init.vim
    echo "if isdirectory(expand('$HOME/compProVim'))" >> $XDG_CONFIG_HOME/nvim/init.vim
    echo "\tcommand! Comp source ${PWD}/execute.vim"  >> $XDG_CONFIG_HOME/nvim/init.vim
    echo "endif"                                      >> $XDG_CONFIG_HOME/nvim/init.vim
fi
