# vim:foldmethod=marker:foldlevel=0

# Environment variables  {{{1
## Source sensitive configs I don't want in SVN {{{2
if [ -f ~/.private_profile ];
    then source ~/.private_profile
fi

## Set vim as default editor {{{2
VIMRUNTIME=/usr/local/bin
EDITOR=/usr/local/bin/vim

## Export frequently edited conf/rc files {{{2
export MYZSH=~/.zshrc
export MYPROFILE=~/.profile
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
