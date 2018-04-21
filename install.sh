#!/bin/sh

if grep Comp $XDG_CONFIG_HOME/nvim/init.vim > /dev/null; then
	echo "CompProMode has been installed."
else
	echo "\"CompProMode\ncommand! Comp source ${PWD}/execute.vim" >> $XDG_CONFIG_HOME/nvim/init.vim
fi
