export ZSH=$HOME/.oh-my-zsh

# Better than symlinking my customizations to ~/.oh-my-zsh
ZSH_CUSTOM=$HOME/dotfiles/zsh

# Use my customized command prompt
ZSH_THEME="nezaj"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Environment varibles, Virtualenv, Pip
source $HOME/.profile

# load custom executable functions
# https://github.com/thoughtbot/dotfiles/blob/fe180f78d5a9437770d76dddaa19e978ef7c5291/zshrc#L18-L21
for function in ~/dotfiles/zsh/functions/*; do
  source $function
done

export PATH="$PATH"
