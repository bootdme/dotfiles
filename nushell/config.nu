# The default config record. This is where much of your global configuration is setup.
$env.config = ($env.config? | default {} | merge {
    show_banner: false # true or false to enable or disable the welcome banner at startup
    edit_mode: vi # emacs, vi
})

# Make edits below

source ~/dotfiles/nushell/.zoxide.nu

source ($nu.default-config-dir | path join 'aliases.nu')
source ($nu.default-config-dir | path join 'completion.nu')
