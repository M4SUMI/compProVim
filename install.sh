#!/bin/sh
if ! grep XDG_CONFIG_HOME $HOME/.bashrc > /dev/null; then
	echo "export XDG_CONFIG_HOME=$HOME/.config" >> $HOME/.bashrc
	. $HOME/.bashrc
    return
fi

if grep Comp $XDG_CONFIG_HOME/nvim/init.vim > /dev/null; then
	echo "CompProMode has been installed."
else
    echo "\"CompProMode"                               >> $XDG_CONFIG_HOME/nvim/init.vim
    echo "if isdirectory(expand('$HOME/compProVim'))"  >> $XDG_CONFIG_HOME/nvim/init.vim
    echo "    command! Comp source ${PWD}/execute.vim" >> $XDG_CONFIG_HOME/nvim/init.vim
    echo "endif"                                       >> $XDG_CONFIG_HOME/nvim/init.vim

    touch compile_commands.json
    echo "["                                              >> compile_commands.json
    echo "    {"                                          >> compile_commands.json
    echo "        'command' : 'g++ -std=c++14 main.cpp'," >> compile_commands.json
    echo "        'directory' : '${PWD}',"                >> compile_commands.json
    echo "        'file' : 'main.cpp',"                   >> compile_commands.json
    echo "    {"                                          >> compile_commands.json
    echo "["                                              >> compile_commands.json
fi


