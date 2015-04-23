#!/bin/bash
if [[ $# -eq 2 ]]
then
    cd ~/git && mkdir -p $1 && cd $1 && git clone https://github.com/$1/$2.git
else
    if [[ $# -eq 1 ]] 
    then
        _REPO="$1 $2"
        IFS="[/ ]" read REPO_OWNER REPO_NAME <<< $_REPO
        cd ~/git && mkdir -p ${REPO_OWNER} && cd ${REPO_OWNER} && git clone https://github.com/${REPO_OWNER}/${REPO_NAME}.git
    fi
fi
