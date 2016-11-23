export EDITOR="nano -w"
export GOPATH="$HOME/gocode"

export RUST_SRC_PATH="/usr/src/rust/src/"

# Service is run and managed by systemd.
export SSH_AUTH_SOCK="/run/user/1000/ssh-agent.socket"
# export SSH_AUTH_SOCK=$HOME/.gnupg/S.gpg-agent.ssh

export PATH="$HOME/bin:$HOME/gocode/bin:/usr/lib/ccache/bin:$PATH"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
