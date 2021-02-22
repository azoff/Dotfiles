#!/usr/bin/env bash
alias ls='ls -G'
alias la='ls -lGa'

alias dc='docker-compose'
alias dcrun='dc run --rm'
alias docker-prune='echo "container image volume" | xargs -n1 -I%t docker %t prune -f'
