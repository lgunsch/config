# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt APPEND_HISTORY

export EDITOR="sublime"

setopt NO_CLOBBER

# Write after each command
# setopt INC_APPEND_HISTORY

# Killer: share history between multiple shells
setopt SHARE_HISTORY

# If I type cd and then cd again, only save the last one
setopt HIST_IGNORE_DUPS

# Even if there are commands inbetween commands that are the same, still only save the last one
setopt HIST_IGNORE_ALL_DUPS

# Pretty    Obvious.  Right?
setopt HIST_REDUCE_BLANKS

# When using a hist thing, make a newline show the change before executing it.
setopt HIST_VERIFY

# Save the time and how long a command ran
setopt EXTENDED_HISTORY

setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

unset MANPATH
export MANPATH=$HOME/man:$(manpath)

autoload -U colors
colors

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ll='ls -la'

alias bigmon='xrandr --output VGA1 --auto  --left-of LVDS1'
alias todatasource='ssh -p 2022 lgunsch@datasource.streamon.fm'
alias tonagios='ssh -p 2022 lgunsch@nagios.streamon.fm'
alias todev='ssh -p 2022 lgunsch@dev.streamon.fm'
alias tognh='ssh -p 2022 lgunsch@yeg1-1.greatnorthhosting.com'

# Ruby environment
eval "$(rbenv init -)"
[[ -s "/home/lgunsch/.rvm/scripts/rvm" ]] && source "/home/lgunsch/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Python environment
source /etc/bash_completion.d/virtualenvwrapper

# Perl CPAN
export PERL_LOCAL_LIB_ROOT="/home/lgunsch/perl5";
export PERL_MB_OPT="--install_base /home/lgunsch/perl5";
export PERL_MM_OPT="INSTALL_BASE=/home/lgunsch/perl5";
export PERL5LIB="/home/lgunsch/perl5/lib/perl5/x86_64-linux-gnu-thread-multi:/home/lgunsch/perl5/lib/perl5";
export PATH="/home/lgunsch/perl5/bin:$PATH";
