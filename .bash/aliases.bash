#!/usr/bin/env bash
alias ls='ls -G'
alias la='ls -lGa'

alias dc='docker-compose'
alias dexec='docker exec -it'
alias dcrun='dc run --rm'

alias nubectl='kubectl --kubeconfig ~/.kube/nuc.config'
alias nubly='nubectl apply -f'
alias txr='ssh plex@nuc.azof.fr transmission-remote -n transmission:transmission -w /var/lib/plexmediaserver/media'

eval $(thefuck --alias)