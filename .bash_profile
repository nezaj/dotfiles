VIMRUNTIME=/usr/bin
EDITOR=/usr/bin/vim

# Source virtualenvwrapper for manging python libraries
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

# Source private enviornment variables
if [ -f ~/.private_profile ]; then
    source ~/.private_profile
fi

# virtualenv aliases
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

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# RVM aliases
alias gs.use='rvm gemset use'
alias g.list='gem list'
alias gs.list='rvm gemset list'

# Enviornment Variables
export WORKON_HOME=~/Virtualenvs
export MYVIMRC=~/.vimrc
export PGDATA=/usr/local/var/postgres
export PATH=/usr/local/bin:$PATH

