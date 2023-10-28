# Add homebrew & kitty completions (macOS) to fish
switch (uname)
    case Darwin
        fish_add_path /opt/homebrew/bin
        fish_add_path /opt/homebrew/sbin
        /Applications/kitty.app/Contents/MacOS/kitty + complete setup fish | source
    case Linux
        source /usr/share/fzf/shell/key-bindings.fish
        set -gx GPG_TTY (tty)
end

# Vi Mode
fish_vi_key_bindings

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

# fzf
set -gx FZF_DEFAULT_COMMAND 'fd --type f --color=never --hidden'
set -gx FZF_DEFAULT_OPTS --no-height

set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -gx FZF_CTRL_T_OPTS "--preview 'bat --color=always --line-range :50 {}'"

# Fixes Alt+C (in vi mode)
bind -M insert ç fzf-cd-widget

set -gx FZF_ALT_C_COMMAND 'fd --type d . --color=never --hidden'
set -gx FZF_ALT_C_OPTS "--preview 'tree -C {} | head -50'"

# Node Version Manager 
set -gx NVM_DIR ~/.nvm
set PATH "$(which node)" $PATH
nvm use default --silent

# Disable .node_repl_history
set -gx NODE_REPL_HISTORY ''

# Migrate .lesshhst & .lesskey to proper locations
set -gx LESSHISTFILE $XDG_STATE_HOME/less/history
set -gx LESSKEY $XDG_STATE_HOME/less/keys

set -gx PATH "$HOME/.cargo/bin" $PATH

fish_add_path ~/.local/share/nvim/mason/bin

# Rustup tab completions
if [ ! -d $HOME/.config/fish/completions ]
    mkdir -p ~/.config/fish/completions
    rustup completions fish >~/.config/fish/completions/rustup.fish
end

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

# Human readable disk commands
alias df='df -h'
alias du='du -ch'
