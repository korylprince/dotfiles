# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gallois"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git command-not-found zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

### my stuff ###
export EDITOR=vim
export GIT_EDITOR=vim
alias vi='vim'
alias wifistart='sudo systemctl start netctl-auto@wlp3s0.service'
alias wifirestart='sudo systemctl restart netctl-auto@wlp3s0.service'
alias wifistop='sudo systemctl stop netctl-auto@wlp3s0.service'
alias ethstart='sudo ip link set enp12s0 up && sudo dhclient enp12s0'
alias ethstop='sudo dhclient -r enp12s0 && sudo ip link set enp12s0 down'
alias ldapdump='python2 -i ~/Dropbox/Network/Useful\ Scripts/ldap/ldapdumpad.py'
alias ipcheck='python2 ~/Dropbox/Network/Useful\ Scripts/ipcheck.py'
alias gnome-terminal='TERM=xterm-256color gnome-terminal'
setopt VI

# make undo unlimited
bindkey -M vicmd 'u' undo
bindkey -M vicmd '^r' redo
# fix history search
bindkey '^R' history-incremental-search-backward

# 10 second wait if you do something that will delete everything.
setopt RM_STAR_WAIT

#android + PATHs
export PATH=$PATH:/home/administrator/android-sdk-linux/tools:/home/administrator/android-sdk-linux/platform-tools
export USE_CCACHE=1

#go
export GOPATH=/home/administrator/code/go
export GOROOT=/usr/lib/go
export PATH=$PATH:$GOPATH/bin

[ -f /etc/profile.d/vte.sh ] && source /etc/profile.d/vte.sh
[ -f ~/.python/funcs.sh ] && source ~/.python/funcs.sh
