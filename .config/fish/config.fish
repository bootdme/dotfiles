# Add homebrew & kitty completions (macOS) to fish
switch (uname)
	case Darwin
		fish_add_path /opt/homebrew/bin
		/Applications/kitty.app/Contents/MacOS/kitty + complete setup fish | source
end

set fish_greeting ""
set TERM "xterm-256color"

set -gx LC_ALL "en_US.UTF-8"
set -gx LANG "en_US.UTF-8"

set -gx EDITOR "nvim -f"
set -gx GIT_EDITOR $EDITOR

set -gx XDG_CONFIG_HOME ~/.config
set -gx XDG_STATE_HOME ~/.local/state
set -gx XDG_CACHE_HOME ~/.cache
set -gx XDG_DATA_HOME ~/.local/share

set -gx NVM_DIR ~/.nvm
nvm use default --silent

set -gx NODE_REPL_HISTORY ''

set -gx LESSHISTFILE $XDG_STATE_HOME/less/history
set -gx LESSKEY $XDG_STATE_HOME/less/keys

alias vim='nvim'

alias ls='exa -al --color=always --group-directories-first'
alias la='exa -a --color=always --group-directories-first'
alias ll='exa -l --color=always --group-directories-first'
alias lt='exa -aT --color=always --group-directories-first'
alias l.='exa -a | egrep "^\."'

alias config='git --git-dir=$HOME/.dot/ --work-tree=$HOME'

alias df='df -h'
alias du='du -ch'
