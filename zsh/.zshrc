export ZSH="$HOME/.oh-my-zsh"
ZSH_DISABLE_COMPFIX=true
ZSH_THEME="awesomepanda"

HYPHEN_INSENSITIVE="true"
CASE_SENSITIVE="false"

COMPLETION_WAITING_DOTS="true"

unsetopt autocd
ZSH_CUSTOM=$HOME/dot-files/zsh/plugins/

plugins=(
    git
    docker
)

source $ZSH/oh-my-zsh.sh
source ~/dot-files/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/dot-files/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

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

function chpwd() {
    emulate -L zsh
    ls -a 
}
