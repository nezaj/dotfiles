# vim:foldmethod=marker:foldlevel=0

# Environment variables  {{{1
## Export frequently edited conf/rc files {{{2
export MYZSH=~/.zshrc
export MYPROFILE=~/.profile
export MYPRIVATE=~/.private_profile
export MYVIMRC=~/.vimrc
export MYTMUXCONF=~/.tmux.conf
export MYTODOS=~/todos.md

## Fix PGDATA {{{2
export PGDATA=/usr/local/var/postgres

## Customize PATH {{{2

# Tools Path
LOCAL_TOOLBELT="/usr/local/bin"
NODE_PATH="./node_modules/.bin"
TOOLS_PATH="$LOCAL_TOOLBELT:$NODE_PATH"

# Extra Paths
HEROKU_TOOLBELT="/usr/local/heroku/bin"
ETC_PATHS="/usr/bin:/bin:/usr/sbin:/sbin"
EXTRAS_PATH="$HEROKU_TOOLBELT:$ETC_PATHS"

# Export actual path
export PATH="$TOOLS_PATH:$EXTRAS_PATH"

# Python {{{1
# Configures tools and settings specifically related to python development

## Configure virtualenvwrapper {{{2
## Virtualenvwrapper makes it easy to work with python virtualenvs
## http://virtualenvwrapper.readthedocs.org/en/latest/

### Source virtualenvwrapper {{{3
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

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

# Aliases {{{1

# Virtualenvwrapper {{{2
# http://blog.doughellmann.com/2010/01/virtualenvwrapper-tips-and-tricks.html
alias v='workon'
alias v.cd='cdsitepackages'
alias v.ls='lsvirtualenv -b'
alias v.mk='mkvirtualenv --no-site-packages'
alias v.mk3='mkvirtualenv --python=/usr/local/bin/python3 --no-site-packages'
alias v.rm='rmvirtualenv'


# Pretty print json curls {{{2
function jcurl {
    curl "$@" | jq '.'
}

# Source sensitive configs I don't want in git {{{1
if [ -f ~/.private_profile ];
    then source ~/.private_profile
fi
