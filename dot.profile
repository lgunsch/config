eval $(ssh-agent)

export EDITOR="emacs -nw"
export GOPATH="$HOME/gocode"
# export RUST_SRC_PATH="/usr/src/rust/src/"
export PATH="$HOME/bin:$HOME/gocode/bin:/usr/lib/ccache/bin:$PATH"

# export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH="$HOME/.cargo/bin:$PATH"
