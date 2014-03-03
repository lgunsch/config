# Ruby environment
rvm > /dev/null

# Python Virtualenv wrapper
. /home/lgunsch/.config/fish/virtualfish/virtual.fish
. /home/lgunsch/.config/fish/virtualfish/auto_activation.fish
. /home/lgunsch/.config/fish/virtualfish/global_requirements.fish

alias todatasource 'ssh -p 2022 lgunsch@datasource.streamon.fm'
alias tonagios 'ssh -p 2022 lgunsch@nagios.streamon.fm'
alias todev 'ssh -p 2022 lgunsch@dev.streamon.fm'
alias tognh 'ssh -p 2022 lgunsch@yeg1-1.greatnorthhosting.com'

alias toco1 'ssh -p 2022 lgunsch@chicago-o1.streamon.fm'
alias topo1 'ssh -p 2022 lgunsch@phoenix-o1.streamon.fm'
alias tocr1 'ssh -p 2022 lgunsch@chicago-r1.streamon.fm'
alias tocr2 'ssh -p 2022 lgunsch@chicago-r2.streamon.fm'
alias topr1 'ssh -p 2022 lgunsch@phoenix-r1.streamon.fm'
alias topr2 'ssh -p 2022 lgunsch@phoenix-r2.streamon.fm'


function set_django_config --on-event virtualenv_did_activate
    set name (basename $VIRTUAL_ENV)
    echo "The virtualenv $name was activated."
    switch $name
        case '<v-env-name>' '<v-env-name-2>'
            set key 'key-name'
            set env '<settings>'

        case '*'
            echo 'No django project detected.'
    end
 
    set -gx SECRET_KEY $key
    set -gx DJANGO_SETTINGS_MODULE $env

    echo "Secret key is: $SECRET_KEY"
    echo "Using django settings: $DJANGO_SETTINGS_MODULE"
end
