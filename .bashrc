# ====================== Environment variables  ======================

# Source sensitive configs I don't want in SVN
if [ -f ~/.private_profile ];
    then source ~/.private_profile
fi

# I like Vim
VIMRUNTIME=/usr/bin
EDITOR=/usr/bin/vim

# I like to edit these files so often I have keyboard
# mappings for them in Vim
export MYBASH=~/.bashrc
export MYPRIVATE=~/.private_profile
export MYVIMRC=~/.vimrc
export MYTMUXCONF=~/.tmux.conf
export MYTODOS=~/todos.md

# Point java to the right place
export JAVA_HOME="/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home"

# Point postgres to the right place
export PGDATA=/usr/local/var/postgres

# Make PATH the way I want it
LOCAL_TOOLBELT="/usr/local/bin"
HEROKU_TOOLBELT="/usr/local/heroku/bin"
export PATH="$LOCAL_TOOLBELT:$HEROKU_TOOLBELT:$PATH"

# ============================= Python ===============================

# Virtualenvwrapper makes it easier to work with virtualenv
# http://virtualenvwrapper.readthedocs.org/en/latest/
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

# Useful virtualenvwrapper aliases
# http://blog.doughellmann.com/2010/01/virtualenvwrapper-tips-and-tricks.html
alias v='workon'
alias v.deactivate='deactivate'
alias v.mk='mkvirtualenv --no-site-packages'
alias v.mk3='mkvirtualenv --python=/usr/local/bin/python3 --no-site-packages' # Makes python3 virtualenv
alias v.mk_withsitepackages='mkvirtualenv'
alias v.rm='rmvirtualenv'
alias v.switch='workon'
alias v.add2virtualenv='add2virtualenv'
alias v.cdsitepackages='cdsitepackages'
alias v.cd='cdvirtualenv'
alias v.lssitepackages='lssitepackages'

# Default location to save virtualenvs
export WORKON_HOME=~/.virtualenvs

# Make sure pip installs to virtualenvs only
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true

# Cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

# ============================= Ruby ===============================

# Use RVM for environment management for ruby projects
# http://rvm.io/rvm/about
if [ -f ~/.rvm/scripts/rvm ]
    then source ~/.rvm/scripts/rvm
fi

# Useful RVM aliases
alias gs.use='rvm gemset use'
alias gs.deactivate='gs.use default'
alias g.list='gem list'
alias gs.list='rvm gemset list'

# ============================ PS1 ================================

# This section configures the colors for my PS1 prompt
# http://engineerwithoutacause.com/show-current-virtualenv-on-bash-prompt.html

# Terminal color codes
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

# Exports customized PS1 env variable.
function set_prompt() {

    # It's nice to know who I am
    myuser="${UC}\u${NIL} "

    # Saves me from always having to type git branch
    _git_branch=$(git symbolic-ref HEAD 2>/dev/null)
    _git_branch=${_branch#refs/heads/} # apparently faster than sed

    # It's convenient to know whether I have uncommitted changes
    # http://henrik.nyh.se/2008/12/git-dirty-prompt#comment-8325834
    if git update-index -q --refresh 2>/dev/null; git diff-index --quiet --cached HEAD --ignore-submodules -- 2>/dev/null && git diff-files --quiet --ignore-submodules 2>/dev/null
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
    export PS1="${myuser}${branch}${path}${venv}${end}"
}

# Bash will call this before displaying the prompt
export PROMPT_COMMAND=set_prompt
