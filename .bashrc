# vim:foldmethod=marker:foldlevel=0

# Environment variables  {{{1
## Source sensitive configs I don't want in SVN {{{2
if [ -f ~/.private_profile ];
    then source ~/.private_profile
fi

## Set vim as default editor {{{2
VIMRUNTIME=/usr/bin
EDITOR=/usr/bin/vim

## Export frequently edited conf/rc files {{{2
export MYBASH=~/.bashrc
export MYPRIVATE=~/.private_profile
export MYVIMRC=~/.vimrc
export MYTMUXCONF=~/.tmux.conf
export MYTODOS=~/todos.md

## Fix JAVA_HOME {{{2
export JAVA_HOME="/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home"

## Fix PGDATA {{{2
export PGDATA=/usr/local/var/postgres

## Customize PATH {{{2
ETC_PATHS="/usr/bin:/bin:/usr/sbin:/sbin"
LOCAL_TOOLBELT="/usr/local/bin"
HEROKU_TOOLBELT="/usr/local/heroku/bin"
export PATH="$LOCAL_TOOLBELT:$HEROKU_TOOLBELT:$ETC_PATHS"

# Python {{{1
# Configures tools and settings specifically related to python development

## Configure virtualenvwrapper {{{2
## Virtualenvwrapper makes it easy to work with python virtualenvs
## http://virtualenvwrapper.readthedocs.org/en/latest/

### Source virtualenvwrapper {{{3
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

### Set virtualenvwrapper aliases {{{3
### http://blog.doughellmann.com/2010/01/virtualenvwrapper-tips-and-tricks.html
alias v='workon'
alias v.mk='mkvirtualenv --no-site-packages'
alias v.mk3='mkvirtualenv --python=/usr/local/bin/python3 --no-site-packages'
alias v.rm='rmvirtualenv'
alias v.cd='cdsitepackages'

### Set default location for virtualenvs {{{3
export WORKON_HOME=~/.virtualenvs

## Configure pip {{{2
## pip is a tool for installing and managing python packages
## https://pypi.python.org/pypi/pip

### Ensure pip installs to virtualenvs only {{{3
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true

### Cache pip-installed packages to avoid re-downloading {{{3
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

# PS1 {{{1
# Configures custom PS1 prompt
# http://engineerwithoutacause.com/show-current-virtualenv-on-bash-prompt.html

## Alias terminal colors to use in set_prompt {{{2
RED='\[\033[31m\]'
GREEN='\[\033[32m\]'
YELLOW='\[\033[33m\]'
BLUE='\[\033[34m\]'
PURPLE='\[\033[35m\]'
CYAN='\[\033[36m\]'
WHITE='\[\033[37m\]'
NIL='\[\033[00m\]'

UC=$PURPLE  # username color
GC=$YELLOW  # Git color
LC=$GREEN   # PWD color
VC=$CYAN    # Virtualenv color

## Define set_prompt to export customized PS1 {{{2
function set_prompt() {

    # It's nice to know who I am
    myuser="${UC}\u${NIL} "

    # Saves me from always having to type git branch
    _git_branch=$(git symbolic-ref HEAD 2>/dev/null)
    _git_branch=${_git_branch#refs/heads/} # apparently faster than sed

    # It's convenient to know whether I have uncommitted changes
    # http://henrik.nyh.se/2008/12/git-dirty-prompt#comment-8325834
    if git update-index -q --refresh 2>/dev/null;
       git diff-index --quiet --cached HEAD --ignore-submodules -- 2>/dev/null && \
       git diff-files --quiet --ignore-submodules 2>/dev/null
        then _dirty=""
    else
       _dirty="${RED}(dirty)${NIL}"
    fi

    # Now I'll always know what branch I'm on and whether I have uncommited code
    if [[ -n $_git_branch ]]; then
       git="${NIL}at ${GC}${_git_branch}${_dirty}${NIL} "
    else
        git=""
    fi

    # I also want to always know my current path w/o typing pwd.
    # Doing extra work to condense all paths with $HOME in it to ~
    # (e.g. $HOME/some/dir --> ~/some/dir)
    _pwd=`pwd | sed "s#$HOME#~#"`
    if [[ $_pwd == "~" ]]; then
       _dirname=$_pwd
    else
       _dirname=`dirname "$_pwd" `
        if [[ $_dirname == "/" ]]; then
              _dirname=""
        fi
       _dirname="$_dirname/`basename "$_pwd"`"
    fi
    path="in ${LC}${_dirname}${NIL} "

    # Saves me from manually checking which virtualenv I'm working on
    if [[ $VIRTUAL_ENV != "" ]]; then
       venv="on ${VC}${VIRTUAL_ENV##*/} "
    else
       venv=''
    fi

    # I like having the $ sign at the end of the prompt
    end="${NIL}\$${NIL} "

    # Time to put it all together
    export PS1="${myuser}${git}${path}${venv}${end}"
}

## Set PROMPT_COMMAND to invoke set_prompt {{{2
## bash will call this before displaying the prompt, which will export the custom PS1
export PROMPT_COMMAND=set_prompt
