export EDITOR="nano -w"
export GOPATH="$HOME/gocode"

# Service is run and managed by systemd.
export SSH_AUTH_SOCK="/run/user/1000/ssh-agent.socket"
# export SSH_AUTH_SOCK=$HOME/.gnupg/S.gpg-agent.ssh

export PATH="$HOME/bin:$HOME/gocode/bin:/usr/lib/ccache/bin:$PATH"
