# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

export TERM="screen-256color"

setopt autocd
setopt auto_pushd
##############################################################################
# History Configuration
##############################################################################
HISTSIZE=2000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=10000               #Number of history entries to save to disk
HISTDUP=erase               #Erase duplicates in the history file
setopt hist_ignore_all_dups hist_save_nodups
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed

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
alias gch="git checkout"
alias gom="git checkout master"
alias gob="git checkout -b"
alias vim="nvim"
alias v="nvim"
alias gup='git pull origin master --rebase'

alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ls='ls --color=always'

bindkey '^ ' autosuggest-accept

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export EDITOR=nvim
export BAT_THEME="OneHalfDark"

# LANG=""
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# For case-insensetive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
source $HOME/.asdf/asdf.sh
export PATH=/home/locke/.yarn/bin:/home/locke/.config/yarn/global/node_modules/.bin:/home/locke/.asdf/shims:/home/locke/.asdf/bin:/home/locke/bin:/usr/local/bin:/home/locke/.asdf/installs/tmux/3.1/bin:/home/locke/.local/kitty.app/bin:/home/locke/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/locke/.rvm/bin:/home/locke/.fzf/bin:/home/locke/.asdf/installs/nodejs/15.5.0/.npm/bin

export PATH=$PATH:/home/locke/bin/Sencha/Cmd

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source $HOME/.zinit/bin/zinit.zsh

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
  print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
  command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
  command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit for \
  light-mode zsh-users/zsh-autosuggestions \
  light-mode zdharma/fast-syntax-highlighting \
  light-mode OMZ::plugins/git/git.plugin.zsh \
  light-mode MichaelAquilina/zsh-you-should-use

### End of Zinit's installer chunk

### Zinit plugins
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit load zsh-users/zsh-autosuggestions
