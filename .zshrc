export ZSH="$HOME/.oh-my-zsh"
export GO111MODULE=on
export PATH="$PATH:/Users/rorymagee/go/bin"
ZSH_DISABLE_COMPFIX=true
ZSH_THEME="robbyrussell"
HYPHEN_INSENSITIVE="true"
CASE_SENSITIVE="false"

COMPLETION_WAITING_DOTS="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Plugins section

if [[ "$OSTYPE" == "darwin"* ]]; then
    # Update zplug home for mac os
    export ZPLUG_HOME=/opt/homebrew/opt/zplug
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    alias ccc="xclip -sel clip"
    # *nix specific aliases
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

alias sudo="sudo "
alias docker-clean='docker volume rm $(docker volume ls -qf dangling=true)'
alias startdb="pg_ctl -D /opt/homebrew/var/postgresql@14 start"
alias stopdb="pg_ctl -D /opt/homebrew/var/postgresql@14 stop"

[ -s "/Users/rorymagee/.bun/_bun" ] && source "/Users/rorymagee/.bun/_bun"

function chpwd() {
    emulate -L zsh
    ls -a 
}
