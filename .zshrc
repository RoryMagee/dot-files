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
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    export ZPLUG_HOME=$HOME/.zplug
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

alias vim="nvim"
alias dkr="docker"
alias dkrc="docker-compose"
alias speedtest="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -"
alias sleep="systemctl suspend"
alias rgf="rg --files | rg"

function chpwd() {
    emulate -L zsh
    ls -a 
}
