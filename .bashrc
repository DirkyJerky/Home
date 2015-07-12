alias ccat="ccat --bg dark"
export GOPATH="${HOME}/golang"

export BASE_LSCOLORS=ExFxCxDxBxegedabagacad

export EDITOR="vim"

export PS1="\\[$(tput setab 4)$(tput setaf 1)\\]"'{\w}'"\\[$(tput sgr0)"'$(~/etc/ps1_exitstatus $?)'"$(tput bold)\\]"'\$'"\\[$(tput sgr0)\\] "
export PS2="\\[$(tput setab 4)$(tput setaf 1)\\]"'>'"\\[$(tput sgr0)\\]"

# Personal bin takes high precidence

# Set JAVA_HOME for 1.7 JDK
# export JAVA_HOME="/Library/Java/JavaVirtualMachines/1.7.0_45.jdk/Contents/Home"

# source ~/.git-prompt.sh
export PATH="/usr/local/aliases:${PATH}"
export PATH="/usr/local/bin:${PATH}"
export PATH="/usr/local/sbin:${PATH}"

export PATH="${PATH}:${HOME}/golang/bin"
export PATH="${HOME}/bin:${PATH}"

case `uname` in
    Darwin)
        if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
                . $(brew --prefix)/share/bash-completion/bash_completion
        fi

        export CLICOLOR=1
        export LSCOLORS=${BASE_LSCOLORS}
        ;;

    Cygwin)
        export CLICOLOR=1
        export LSCOLORS=${BASE_LSCOLORS}

        ;;
esac
