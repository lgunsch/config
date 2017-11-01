export EDITOR="emacsclient -a 'nano -w' -t"

export GOPATH="$HOME/gocode"

export RUST_SRC_PATH="/usr/src/rust/src/"

# Service is started and managed by systemd.
export SSH_AUTH_SOCK="/run/user/1000/ssh-agent.socket"

export PATH="$HOME/bin:$HOME/gocode/bin:/usr/lib/ccache/bin:$PATH"

export PERL5LIB="$HOME/workspace/lib-common/lib/perl${PERL5LIB:+:$PERL5LIB}"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
