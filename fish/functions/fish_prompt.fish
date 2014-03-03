function fish_prompt --description 'Write out the prompt'
	if test -z $WINDOW
   printf '%s%s@%s%s%s%s%s' (set_color yellow) (whoami) (set_color purple) (hostname|cut -d . -f 1) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
 else
   printf '%s%s@%s%s%s(%s)%s%s%s' (set_color yellow) (whoami) (set_color purple) (hostname|cut -d . -f 1) (set_color white) (echo $WINDOW) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
 end
 printf '%s' (set_color red) (__fish_git_prompt) (set_color normal)
 if set -q VIRTUAL_ENV
   echo -n -s (set_color cyan) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) ""
 end
 echo -n '> '
end
