alias rm 'rm -i'
alias mv 'mv -i'
alias cp 'cp -i'
alias ln 'ln -i'

alias ip 'ip -color -human'

alias chown 'chown --preserve-root'
alias chmod 'chmod --preserve-root'
alias chgrp 'chgrp --preserve-root'

alias emc 'emacsclient -nc'
alias em 'emacs --quick -nw'

eval (python -m virtualfish auto_activation)
