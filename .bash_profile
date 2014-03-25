# Yea, I'm a Vim guy.
VIMRUNTIME=/usr/bin
EDITOR=/usr/bin/vim

# Source bashrc
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

# Source private enviornment variables
if [ -f ~/.private_profile ]; then
    source ~/.private_profile
fi

# Source virtualenvwrapper for managing python libraries
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

# Virtualenv aliases
# http://blog.doughellmann.com/2010/01/virtualenvwrapper-tips-and-tricks.html
alias v='workon'
alias v.deactivate='deactivate'
alias v.mk='mkvirtualenv --no-site-packages'
alias v.mk_withsitepackages='mkvirtualenv'
alias v.rm='rmvirtualenv'
alias v.switch='workon'
alias v.add2virtualenv='add2virtualenv'
alias v.cdsitepackages='cdsitepackages'
alias v.cd='cdvirtualenv'
alias v.lssitepackages='lssitepackages'

# Source RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# RVM aliases
function gs.use() {
    rvm gemset use "$1";
    if [ "$1" != "default" ]
    then
        PS1="("$1")\h:\W \u\$ ";
    else
        PS1="\h:\W \u\$ ";
    fi
}
alias gs.deactivate='gs.use default'
alias g.list='gem list'
alias gs.list='rvm gemset list'

# Enviornment variables
export WORKON_HOME=~/.virtualenvs

export MYBASH=~/.bash_profile
export MYPRIVATE=~/.private_profile
export MYVIMRC=~/.vimrc
export MYTMUXCONF=~/.tmux.conf
export MYTODOS=~/todos.md

export PGDATA=/usr/local/var/postgres
export PATH=/usr/local/bin:$PATH

