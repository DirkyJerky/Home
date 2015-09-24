#!/bin/bash
if [[ $# -eq 1 ]]; then
    IFS='/' read _1 _2 <<< $1 &&
    set $_1 $_2
fi

if [[ $# -eq 2 ]]; then
    mkdir -p ~/git/${1}/${2}
    cd ~/git/${1}
    git clone https://github.com/${1}/${2}.git 
fi
