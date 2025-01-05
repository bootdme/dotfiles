def create_left_prompt [] {
    let dir = match (do -i { $env.PWD | path relative-to $nu.home-path }) {
        null => $env.PWD
        '' => '~'
        $relative_pwd => ([~ $relative_pwd] | path join)
    }

    let path_color = (if (is-admin) { ansi red_bold } else { ansi green_bold })
    let separator_color = (if (is-admin) { ansi light_red_bold } else { ansi light_green_bold })
    let path_segment = $"($path_color)($dir)"

    $path_segment | str replace --all (char path_sep) $"($separator_color)(char path_sep)($path_color)"
}

$env.PROMPT_COMMAND = {|| create_left_prompt }

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

do --env {
    let ssh_agent_file = (
        $nu.temp-path | path join $"ssh-agent-($env.USER?).nuon"
    )

    if ($ssh_agent_file | path exists) {
        let ssh_agent_env = open ($ssh_agent_file)
        if ($"/proc/($ssh_agent_env.SSH_AGENT_PID)" | path exists) {
            load-env $ssh_agent_env
            return
        } else {
            rm $ssh_agent_file
        }
    }

    let ssh_agent_env = ^ssh-agent -c
        | lines
        | first 2
        | parse "setenv {name} {value};"
        | transpose --header-row
        | into record
    load-env $ssh_agent_env
    $ssh_agent_env | save --force $ssh_agent_file

    ssh-add ~/.ssh/id_ed25519_github_personal
}

$env.EDITOR = 'nvim -f'
$env.VISUAL = $env.EDITOR

$env.LESSHISTFILE = '/.cache/less/history'

$env.PATH = ($env.PATH | uniq)

if not (which fnm | is-empty) {
    ^fnm env --json | from json | load-env
    $env.PATH = ($env.PATH | append [$"($env.FNM_MULTISHELL_PATH)/bin"])
}

if ((sys host | get name) == "CachyOS Linux") {
    $env.GPG_TTY = (tty)
    $env.PATH = ($env.PATH | split row (char esep) | append '~/.local/bin')
}

# Mason
$env.PATH = ($env.PATH | split row (char esep) | append '~/.local/share/nvim/mason/bin')

# MacOS
if ((sys host | get name) == "Darwin") {
    # Cargo
    $env.PATH = ($env.PATH | split row (char esep) | append '~/.cargo/bin')

	$env.PATH = ($env.PATH | split row (char esep) | append '/opt/homebrew/sbin' | append '/opt/homebrew/bin')
    $env.PATH = ($env.PATH | split row (char esep) | append '/opt/homebrew/opt/postgresql@17/bin')

    # Python
    $env.PATH = ($env.PATH | split row (char esep) | append '/opt/homebrew/opt/python@3.13/libexec/bin')
    $env.PATH = ($env.PATH | split row (char esep) | append '/Users/bootdme/Library/Python/3.9/bin')
}

zoxide init nushell | save -f ~/dotfiles/nushell/.zoxide.nu
