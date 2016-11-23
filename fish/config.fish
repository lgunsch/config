# Ruby environment
rvm default > /dev/null

# Python Virtualenv wrapper
source /home/lgunsch/.config/fish/virtualfish/virtual.fish
source /home/lgunsch/.config/fish/virtualfish/auto_activation.fish
source /home/lgunsch/.config/fish/virtualfish/global_requirements.fish

alias tognh 'ssh -p 2022 lgunsch@yeg1-1.greatnorthhosting.com'

alias rm 'rm -i'
alias mv 'mv -i'
alias cp 'cp -i'

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
 
    if set -q key
        set -gx SECRET_KEY $key
        echo "Secret key is: $SECRET_KEY"
    end
    if set -q env
        set -gx DJANGO_SETTINGS_MODULE $env
        echo "Using django settings: $DJANGO_SETTINGS_MODULE"
    end
    if set -q aws_public
        set -gx AWS_ACCESS_KEY_ID $aws_public
    end
    if set -q aws_secret
        set -gx AWS_SECRET_ACCESS_KEY $aws_secret
    end
    echo "AWS: $AWS_ACCESS_KEY_ID -- $AWS_SECRET_ACCESS_KEY"
end
