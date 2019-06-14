# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="arvindsraj"

alias ydl-med="youtube-dl -o '%(title)s.%(ext)s' -f 18 --restrict-filenames"
alias ydl-best="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' -o '%(title)s.f%(format_id)s.%(ext)s' --restrict-filenames"


# where to store our virtual envs
export WORKON_HOME=$HOME/.virtualenvs
# where projects will reside
export PROJECT_HOME=$HOME/Projects-Active
# where is the virtualenvwrapper.sh
source /usr/local/bin/virtualenvwrapper_lazy.sh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
