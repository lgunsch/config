#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -la --color=auto'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ln='ln -i'

alias lsmount='mount | column -t'

# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

export PS1="\[\033[38;5;166m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;91m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;28m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\] >\[$(tput sgr0)\]"

alias emc='emacsient -nc'
alias em='emacs --quick -nw'
