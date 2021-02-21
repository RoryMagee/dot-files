export ZSH="$HOME/.oh-my-zsh"
ZSH_DISABLE_COMPFIX=true
ZSH_THEME="awesomepanda"

HYPHEN_INSENSITIVE="true"
CASE_SENSITIVE="false"

COMPLETION_WAITING_DOTS="true"

unsetopt autocd

plugins=(
    git
    docker
    npm
    ng
    tmux
)

source $ZSH/oh-my-zsh.sh

# Plugins section

# Update zplug home for mac os
if [[ "$OSTYPE" == "darwin"* ]]; then

    export ZPLUG_HOME=/usr/local/opt/zplug
    export COMPOSE_HTTP_TIMEOUT=200
    
    fnr() {
        if [ "$1" != "" ] && [ "$2" != "" ]
        then
            rg $1 --files-with-matches | xargs sed -i '' "s/\\$1/$2/g"
        else
            echo "Invalid args"
        fi
    }

elif [[ "$OSTYPE" == "linux-gnu"* ]]; then

    export ZPLUG_HOME=$HOME/.zplug

    # *nix specific aliases
    alias ccc="xclip -sel clip"
    fnr() {
        if [ "$1" != "" ] && [ "$2" != "" ]
        then
            rg $1 --files-with-matches | xargs sed -i "s/\\$1/$2/g"
        else
            echo "Invalid args"
        fi
    }

fi

source $ZPLUG_HOME/init.zsh
zplug "zsh-users/zsh-autosuggestions" 
zplug "zsh-users/zsh-syntax-highlighting" 

# Install plugins if they aren't already installed
if ! zplug check --verbose; then
    printf "Install [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Load plugins
zplug load

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
fi

alias sudo="sudo "
alias dkr="docker"
alias dkrc="docker-compose"
alias speedtest="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -"
alias rgf="rg --files | rg"
alias docker-clean='docker volume rm $(docker volume ls -qf dangling=true)'


function chpwd() {
    emulate -L zsh
    ls -a 
}
