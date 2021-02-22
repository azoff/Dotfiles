#!/usr/bin/env bash
export LSCOLORS=ExFxBxDxCxegedabagacad
export EDITOR='subl -w'
export DOT_HOME=~/Dropbox/Dotfiles
export GIT_PS1_SHOWDIRTYSTATE=true
export GHI_TOKEN="90590cb3fa39aa5d8926acc9fef3b018893d5fe1"
export PATH="$DOT_HOME/bin:$HOME/.cargo/bin:$PATH"
export GPG_TTY=$(tty)
export COMPOSE_DOCKER_CLI_BUILD=1 # improves cache hits by using the CLI docker for building
