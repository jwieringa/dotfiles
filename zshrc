export PATH="/usr/local/sbin:/usr/local/bin:/opt/bin:/usr/local/go/bin:$PATH"

# Golang
export GOPATH=$HOME/go

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/Users/jason/prj/deps/dotfiles/zshrc.new'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install

# unalias run-help
# autoload run-help
# HELPDIR=/usr/local/share/zsh/helpfiles

# Alias
alias b='bundle exec'
alias brs='bundle exec rails server'
alias ds="du -sh */ | sort"
alias bi="bundle install --path vendor/bundle"

# Git Alias
alias gc="git commit"
alias gst="git status"

# Enable bash style comments
# https://stackoverflow.com/questions/11670935/comments-in-command-line-zsh
setopt interactivecomments
