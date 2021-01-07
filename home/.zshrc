# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/locke/.oh-my-zsh"
export TERM="screen-256color"

ZSH_THEME="theunraveler"

plugins=(git zsh-autosuggestions asdf)

source $ZSH/oh-my-zsh.sh

# =========== #
#   Aliases   #
# =========== #
alias gst="git status"
alias gdiff="git diff"
alias gadd="git add"
alias gc="git commit -m"
alias grebase="git rebase -i"
alias gpull="git pull"
alias gpush="git push origin"
alias gstash="git stash"
alias gpop="git stash pop"
alias gsl="git stash list"
alias go="git checkout"
alias gom="git checkout master"
alias gob="git checkout -b"
alias vim="nvim"
alias v="nvim"
alias gup='git pull origin master --rebase'

alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
DISABLE_LS_COLORS="true"
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
bindkey '^ ' autosuggest-accept

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export EDITOR=nvim
export BAT_THEME="OneHalfDark"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
