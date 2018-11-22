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
# Configures tools and settings for javascript development

## Initialize pyenv {{{2
eval "$(pyenv init -)"

# Javascript {{{1
# Configures tools and settings for javascript development

## Node Version Manager (NVM) {{{2
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Aliases {{{1

# Pretty print json curls {{{2
function jcurl {
    curl "$@" | jq '.'
}

# Source sensitive configs I don't want in SVN {{{1
if [ -f ~/.private_profile ];
    then source ~/.private_profile
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
