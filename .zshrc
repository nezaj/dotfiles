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

## Fix zsh completion
## See: https://github.com/ohmyzsh/ohmyzsh/issues/6835#issuecomment-390216875
ZSH_DISABLE_COMPFIX=true

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Environment varibles, Virtualenv, Pip
source $HOME/.profile

export PATH="$PATH"
