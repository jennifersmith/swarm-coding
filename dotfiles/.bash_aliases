# -*- mode: sh -*-
[ "$EMACS" == "t" ] || alias ls="ls --color"

alias e="emacs -nw -Q"

alias ll="ls -l -h"
alias la="ls -a"
alias l="ls"
alias lla="ls -a -l"
alias lh="ls -l -h"

alias grep="grep --color=auto"
alias gerp="grep --color=auto"

alias computer,="sudo"


alias c="curl"
alias f="find"
alias g="git"
alias h="heroku"
alias l="lein"
alias m="more"
alias r="rgrep"
alias s="ssh"

# package management
alias sapti="sudo aptitude install"
alias saptr="sudo aptitude remove"
alias saptd="sudo aptitude update"
alias saptc="apt-cache search"
alias sapts="apt-cache show"

# git
alias gst="git status"
alias gbv="git branch -v"
alias gb="git branch"
alias gco="git checkout"
alias glt="git log -n 10"
alias gsu="git submodule update --init --recursive"

# rubby!
alias be="bundle exec"
