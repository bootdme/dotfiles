let external_completer = {|spans|
	let carapace_completer = {|spans|
		carapace $spans.0 nushell ...$spans
		| from json
		| if ($in | default [] | where value == $"($spans | last)ERR" | is-empty) { $in } else { null }
	}
	let zoxide_completer = {|spans|
		$spans | skip 1 | zoxide query -l $in | lines | where {|x| $x != $env.PWD}
	}

	let expanded_alias = scope aliases | where name == $spans.0 | get -i 0 | get -i expansion
	let spans = if $expanded_alias != null  {
		$spans | skip 1 | prepend ($expanded_alias | split row " " | take 1)
	} else {
		$spans
	}

	match $spans.0 {
		__zoxide_z | __zoxide_zi => $zoxide_completer,
		_ => $carapace_completer
	} | do $in $spans
}

# The default config record. This is where much of your global configuration is setup.
$env.config = ($env.config? | default {} | merge {
    show_banner: false # true or false to enable or disable the welcome banner at startup
    edit_mode: vi # emacs, vi
})

# Make edits below

source ~/dotfiles/nushell/.zoxide.nu

source ($nu.default-config-dir | path join 'aliases.nu')
