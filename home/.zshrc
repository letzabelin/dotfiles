# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/locke/.oh-my-zsh"
export TERM="screen-256color"

ZSH_THEME="powerlevel10k/powerlevel10k"

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

# LANG=""
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH=/home/locke/.yarn/bin:/home/locke/.config/yarn/global/node_modules/.bin:/home/locke/.asdf/shims:/home/locke/.asdf/bin:/home/locke/bin:/usr/local/bin:/home/locke/.asdf/installs/tmux/3.1/bin:/home/locke/.local/kitty.app/bin:/home/locke/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/locke/.rvm/bin:/home/locke/.fzf/bin:/home/locke/.asdf/installs/nodejs/15.5.0/.npm/bin

export PATH=$PATH:/home/locke/bin/Sencha/Cmd

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
