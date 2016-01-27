if [ -f ${HOME}/.bashrc ]; then
    . ${HOME}/.bashrc 
fi
if [ -f ${HOME}/.bashrc.local ]; then
    . ${HOME}/.bashrc.local 
fi
