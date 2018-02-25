#-------------------------------------------------------------------------------
# Path to your dotfiles installation.
#-------------------------------------------------------------------------------

export DOTFILES=$HOME/dotfiles

#-------------------------------------------------------------------------------
# Path to your oh-my-zsh installation.
#-------------------------------------------------------------------------------

export ZSH=$HOME/.oh-my-zsh

#-------------------------------------------------------------------------------
# Set default EDITOR env var to Path to your Vim binary
#-------------------------------------------------------------------------------

export EDITOR=$(which vim)

#-------------------------------------------------------------------------------
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#-------------------------------------------------------------------------------

export POWERLINE_RIGHT_B="none"
export POWERLINE_HIDE_USER_NAME="true"
export POWERLINE_HIDE_HOST_NAME="true"
export POWERLINE_DISABLE_RPROMPT="true"
POWERLINE_PATH="short"
POWERLINE_DETECT_SSH="true"

export ZSH_THEME="powerline"

#-------------------------------------------------------------------------------
# Uncomment the following line to use case-sensitive completion.
#-------------------------------------------------------------------------------

CASE_SENSITIVE="true"

#-------------------------------------------------------------------------------
# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
#-------------------------------------------------------------------------------

# HYPHEN_INSENSITIVE="true"

#-------------------------------------------------------------------------------
# Uncomment the following line to disable bi-weekly auto-update checks.
#-------------------------------------------------------------------------------

# DISABLE_AUTO_UPDATE="true"

#-------------------------------------------------------------------------------
# Uncomment the following line to change how often to auto-update (in days).
#-------------------------------------------------------------------------------

export UPDATE_ZSH_DAYS=7

#-------------------------------------------------------------------------------
# Uncomment the following line to disable colors in ls.
#-------------------------------------------------------------------------------

# DISABLE_LS_COLORS="true"

#-------------------------------------------------------------------------------
# Uncomment the following line to disable auto-setting terminal title.
#-------------------------------------------------------------------------------

# DISABLE_AUTO_TITLE="true"

#-------------------------------------------------------------------------------
# Uncomment the following line to enable command auto-correction.
#-------------------------------------------------------------------------------

# ENABLE_CORRECTION="true"

#-------------------------------------------------------------------------------
# Uncomment the following line to display red dots whilst waiting for completion.
#-------------------------------------------------------------------------------

COMPLETION_WAITING_DOTS="true"

#-------------------------------------------------------------------------------
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
#-------------------------------------------------------------------------------

# DISABLE_UNTRACKED_FILES_DIRTY="true"

#-------------------------------------------------------------------------------
# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
#-------------------------------------------------------------------------------

HIST_STAMPS="yyyy-mm-dd"

#-------------------------------------------------------------------------------
# Would you like to use another custom folder than $ZSH/custom?
#-------------------------------------------------------------------------------

# ZSH_CUSTOM=$DOTFILES

#-------------------------------------------------------------------------------
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#-------------------------------------------------------------------------------

plugins=(git git-extras hub httpie npm composer rails)

#-------------------------------------------------------------------------------
# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
#-------------------------------------------------------------------------------

files=("$DOTFILES/.path" "$DOTFILES/.export" "$DOTFILES/.aliases" "$DOTFILES/.functions" "$DOTFILES/.extra");

for file in "${files[@]}"; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

unset files file;

#-------------------------------------------------------------------------------
# Merge hub function to git
#-------------------------------------------------------------------------------

eval "$(hub alias -s)"

#-------------------------------------------------------------------------------
# Add Pyenv functionality to ZSH shell + pyenv setup
# Also install pipsi, pipenv
#-------------------------------------------------------------------------------
eval "$(pyenv init -)"

pyenv install 3.6.4
pyenv install 3.5.4
pyenv install 2.7.14
pyenv global 3.6.4

# pipsi from github source
curl -O https://raw.githubusercontent.com/mitsuhiko/pipsi/master/get-pipsi.py
python get-pipsi.py --src=git+https://github.com/mitsuhiko/pipsi.git#egg=pipsi
rm get-pipsi.py


# Append pipsi list fail fix workaround
rm $HOME/.local/venvs/pipsi/package_info.json
echo '{"name": "pipsi", "version": "0.10.dev", "scripts": ["/Users/jacobkaplan-moss/.local/bin/pipsi"]}' > $HOME/.local/venvs/pipsi/package_info.json

# pipenv
pipsi install pew
pipsi install pipenv

#-------------------------------------------------------------------------------
# Hook direnv binary to shell so it activates on each directory change
#-------------------------------------------------------------------------------
# eval "$(direnv hook zsh)"

#-------------------------------------------------------------------------------
# Activate Oh-My-Zsh
#-------------------------------------------------------------------------------

source $ZSH/oh-my-zsh.sh


