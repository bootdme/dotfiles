# The prompt indicators are environmental variables that represent
# the state of the prompt
$env.PROMPT_INDICATOR = {|| "> " }
$env.PROMPT_INDICATOR_VI_INSERT = {|| ": " }
$env.PROMPT_INDICATOR_VI_NORMAL = {|| "> " }
$env.PROMPT_MULTILINE_INDICATOR = {|| "::: " }

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
$env.ENV_CONVERSIONS = {
    "PATH": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
    "Path": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
}

# ------------------------------------------------------------------------------

export-env { load-env {
    XDG_STATE_HOME: ($env.HOME | path join '.local' 'share')
    XDG_CONFIG_HOME: ($env.HOME | path join '.config')
    XDG_CACHE_HOME: ($env.HOME | path join '.cache')
    XDG_DATA_HOME: ($env.HOME | path join '.local' 'share')
} } 

export-env { load-env {
    CARGO_HOME: ($env.HOME | path join '.cargo')
    LESSHISTFILE: ($env.XDG_STATE_HOME | path join 'less' 'history')
    LESSKEY: ($env.XDG_STATE_HOME | path join 'less' 'keys')
    SSH_AGENT_TIMEOUT: 300
} }

$env.EDITOR = 'nvim -f'
$env.VISUAL = $env.EDITOR

if ((sys | get host.name) == "Linux") {
    $env.GPG_TTY = (tty)
}

export-env {
    let env_file = $nu.home-path | path join '.env'
        if ($env_file | path exists) {
            open $env_file | from nuon | load-env
        }
}

$env.PATH = ($env.PATH | split row (char esep) | append '~/Library/Python/3.9/bin')

# Cargo
$env.PATH = ($env.PATH | split row (char esep) | prepend '~/.cargo/bin')

# Mason
$env.PATH = ($env.PATH | split row (char esep) | prepend '~/.local/share/nvim/mason/bin')

# fnm
if not (which fnm | is-empty) {
    ^fnm env --json | from json | load-env
    $env.PATH = ($env.PATH | prepend [$"($env.FNM_MULTISHELL_PATH)/bin"])
}

# MacOS
if ((sys | get host.name) == "Darwin") {
	$env.PATH = ($env.PATH | split row (char esep) | prepend '/opt/homebrew/sbin' | prepend '/opt/homebrew/bin')
    $env.PATH = ($env.PATH | split row (char esep) | append '/opt/homebrew/opt/postgresql@16/bin')
}


zoxide init nushell | save -f ~/dotfiles/nushell/.zoxide.nu
