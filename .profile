# vim:foldmethod=marker:foldlevel=0

# Environment variables  {{{1
## Export frequently edited conf/rc files
export MYZSH=~/.zshrc
export MYPROFILE=~/.profile
export MYPRIVATE=~/.private_profile
export MYVIMRC=~/.vimrc
export MYTMUXCONF=~/.tmux.conf
export MYTODOS=~/todos.md

## Fix PGDATA
export PGDATA=/usr/local/var/postgres

## Customize PATH
# Tools Path
LOCAL_TOOLBELT="/usr/local/bin"

# (TODO): Conditionally add this to PATH to handle if PG isn't installed
PG_PATH="/Applications/Postgres.app/Contents/Versions/latest/bin"

NODE_PATH="./node_modules/.bin"
TOOLS_PATH="$NODE_PATH:$PG_PATH:$LOCAL_TOOLBELT"

# Extra Paths
HEROKU_TOOLBELT="/usr/local/heroku/bin"
ETC_PATHS="/usr/bin:/bin:/usr/sbin:/sbin"
EXTRAS_PATH="$HEROKU_TOOLBELT:$ETC_PATHS"

# Java
JDK_PATH="/usr/local/opt/openjdk/bin"

# Export actual path
export PATH="$TOOLS_PATH:$EXTRAS_PATH:$JDK_PATH"

# Javascript {{{1
## Node Version Manager (NVM)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# fzf {{{1
# Load fzf configs (assuming fzf installed via brew)
if [ -e /usr/local/opt/fzf/shell/completion.zsh ]; then
  source /usr/local/opt/fzf/shell/key-bindings.zsh
  source /usr/local/opt/fzf/shell/completion.zsh
fi

# fzf + ag configuration
export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='
--color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
--color info:108,prompt:109,spinner:108,pointer:168,marker:168
'

# Aliases {{{1
# Pretty print json curls
function jcurl {
    curl "$@" | jq '.'
}

function gpm {
    git add .
    git commit -a -m "$*"
    git push
}

alias gs="git status"
alias gap="git add -p"

alias ctags="`brew --prefix`/bin/ctags"
alias makectags="ctags -R -f ./.git/tags ."

# Source sensitive configs I don't want in SVN {{{1
if [ -f ~/.private_profile ];
    then source ~/.private_profile
fi
