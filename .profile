# sensible bash defaults
. ~/.bash/bash-sensible/sensible.bash

# git prompt and colors
. ~/.bash/ps1.bash 

# global constants
. ~/.bash/exports.bash

# global aliases
. ~/.bash/aliases.bash

# bash autocompletion (with git support)
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# local bash settings
. ~/.bash/local.bash