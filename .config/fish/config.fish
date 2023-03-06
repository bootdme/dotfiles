# Add homebrew & kitty completions (macOS) to fish
switch (uname)
    case Darwin
        fish_add_path /opt/homebrew/bin
        fish_add_path /opts/homebrew/sbin
        /Applications/kitty.app/Contents/MacOS/kitty + complete setup fish | source
end

# Disable fish greeting
set fish_greeting ""

# Support colors for other programs
set TERM xterm-256color

# Locales
set -gx LC_ALL "en_US.UTF-8"
set -gx LANG "en_US.UTF-8"

# Make vim default editor and usable with git
set -gx EDITOR "nvim -f"
set -gx GIT_EDITOR $EDITOR

# Set XDG base directories
set -gx XDG_CONFIG_HOME ~/.config
set -gx XDG_STATE_HOME ~/.local/state
set -gx XDG_CACHE_HOME ~/.cache
set -gx XDG_DATA_HOME ~/.local/share

# Node Version Manager 
set -gx NVM_DIR ~/.nvm
nvm use default --silent

# Disable .node_repl_history
set -gx NODE_REPL_HISTORY ''

# Migrate .lesshhst & .lesskey to proper locations
set -gx LESSHISTFILE $XDG_STATE_HOME/less/history
set -gx LESSKEY $XDG_STATE_HOME/less/keys

# Aliases

# Vim
alias vim='nvim'

# Better ls
alias ls='exa -al --color=always --group-directories-first'
alias la='exa -a --color=always --group-directories-first'
alias ll='exa -l --color=always --group-directories-first'
alias lt='exa -aT --color=always --group-directories-first'
alias l.='exa -a | egrep "^\."'

# Clear quicker
alias c='clear'

# Git bare repository for dotfiles
alias config='git --git-dir=$HOME/.dot/ --work-tree=$HOME'

# Human readable disk commands
alias df='df -h'
alias du='du -ch'
