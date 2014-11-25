# vim:syntax=zsh

function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}

function user_host_info {
    myuser="%{$fg[magenta]%}%n%{$reset_color%}"
    myhost="%{$fg[yellow]%}%m%{$reset_color%}"
    echo "$myuser at $myhost"
}

function path_info {
    # Collapse current path
    mypath=$(collapse_pwd)
    echo " in %{$fg_bold[green]%}$mypath%{$reset_color%}"
}

function prompt_char {
    echo "\$"
}
function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo " on %{$fg[cyan]%}`basename $VIRTUAL_ENV`%{$reset_color%}"
}

PROMPT='
$(user_host_info)$(path_info)$(git_prompt_info)$(virtualenv_info)
$(prompt_char) '

ZSH_THEME_GIT_PROMPT_PREFIX=" at %{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}(dirty)"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""
