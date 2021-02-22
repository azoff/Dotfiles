#!/usr/bin/env bash

function kogs() {
	kubectl get pods -ojsonpath="{.items[*].metadata.name}" -l "app=${1}" | tr ' ' '\n' |  \
		xargs -P3 -I{} kubectl logs -f pod/{} ;
}