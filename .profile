# vim:foldmethod=marker:foldlevel=0

# Environment variables  {{{1
## Export frequently edited conf/rc files
export MYZSH=~/.zshrc
export MYPROFILE=~/.profile
export MYPRIVATE=~/.private_profile
export MYVIMRC=~/dotfiles/nvim/init.lua
export MYTMUXCONF=~/.tmux.conf
export MYTODOS=~/todos.md

## Fix PGDATA
export PGDATA=/usr/local/var/postgres

## Customize PATH
# Tools Path
LOCAL_TOOLBELT="/opt/homebrew/bin"

# (TODO): Conditionally add this to PATH to handle if PG isn't installed
PG_PATH="/Applications/Postgres.app/Contents/Versions/latest/bin"

NODE_PATH="./node_modules/.bin"
TOOLS_PATH="$NODE_PATH:$PG_PATH:$LOCAL_TOOLBELT"

# Extra Paths
HEROKU_TOOLBELT="/usr/local/heroku/bin"
ETC_PATHS="/usr/bin:/bin:/usr/sbin:/sbin"
EXTRAS_PATH="$HEROKU_TOOLBELT:$ETC_PATHS"

# Ruby
RUBY_PATH="/usr/local/opt/ruby/bin"

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk

# Export actual path
export PATH="$TOOLS_PATH:$ANDROID_HOME:$RUBY_PATH:$EXTRAS_PATH"


# Java {{{1
# Java version manager (jenv)
if command -v jenv 1>/dev/null 2>&1; then
  eval "$(jenv init -)"
fi

# Java
export JAVA_HOME=$(/usr/libexec/java_home)

# Javascript {{{1
## Node Version Manager (fnm)
[ -s "/opt/homebrew/bin/fnm" ] && eval "$(fnm env --use-on-cd)"  # This loads fnm



# Python {{{1
alias python=/opt/homebrew/bin/python3

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

# Git push master
function gpm {
    git add .
    git commit -a -m "$*"
    git push
}

alias gcf='git clean -fd'

# random password
function pp {
	openssl rand -base64 8 | md5 | head -c16 | pbcopy
}

alias gs="git status"
alias gap="git add -p"

alias ctags="`brew --prefix`/bin/ctags"
alias makectags="ctags -R -f ./.git/tags ."

# Let's use nvim from now on
alias vi=nvim
alias vim=nvim

# Better cat
alias b="bat"

# Interactive git!
alias lg="lazygit"

# Functions {{{1
# Claude docs import/export functions
claude-export() {
  local name=${1:?Usage: claude-export <feature-name>}
  local project=$(basename $PWD)
  local dest=~/claude-docs/$project/$name
  
  # Get untracked files
  local untracked=$(git ls-files --others --exclude-standard)
  if [ -z "$untracked" ]; then
    echo "No untracked files to export"
    return 1
  fi
  
  # Export files
  mkdir -p $dest
  echo "$untracked" | tar -czf - -T - | tar -xzf - -C $dest
  
  # Commit and push
  cd ~/claude-docs && git add . && git commit -m "$project: $name" && git push && cd - > /dev/null
  echo "✓ Exported $(echo "$untracked" | wc -l) files to $project/$name"
}

claude-import() {
  local name=${1:?Usage: claude-import <feature-name>}
  local project=$(basename $PWD)
  local source=~/claude-docs/$project/$name
  
  if [ ! -d "$source" ]; then
    echo "No docs found at $source"
    echo "Available:"
    ls ~/claude-docs/$project/ 2>/dev/null || echo "No docs for $project"
    return 1
  fi
  
  # Import files
  cp -r $source/* .
  echo "✓ Imported Claude docs for $name"
}

# Optional: List available imports
claude-list() {
  local project=$(basename $PWD)
  echo "Available Claude docs for $project:"
  ls ~/claude-docs/$project/ 2>/dev/null || echo "None found"
}

# Source sensitive configs I don't want in SVN {{{1
if [ -f ~/.private_profile ];
    then source ~/.private_profile
fi
