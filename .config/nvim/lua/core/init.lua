-- https://github.com/CharlesChiuGit/nvimdots.lua/blob/main/lua/core/init.lua
local global = require("core.global")

-- Create cache and data directories
function create_dir()
	local data_dir = {
		global.cache_dir .. "backup",
		global.cache_dir .. "session",
		global.cache_dir .. "swap",
		global.cache_dir .. "tags",
		global.cache_dir .. "undo",
	}

	-- Check if cache directory already exists
	if vim.fn.isdirectory(global.cache_dir) == 0 then
		os.execute("mkdir -p " .. global.cache_dir)
		for _, v in pairs(data_dir) do
			if vim.fn.isdirectory(v) == 0 then
				os.execute("mkdir -p " .. v)
			end
		end
	end
end

-- Disable plugins when loading neovim
function disable_plugins()
	local g = vim.g

	-- Disable menu loading
	g.did_install_default_menus = 1
	g.did_install_syntax_menus = 1

	-- Disable native syntax completion
	g.loaded_syntax_completion = 1

	-- Disable load spell files
	g.loaded_spellfile_plugin = 1

	-- Disable netrw
	g.loaded_netrw = 1
	g.loaded_netrwFileHandlers = 1
	g.loaded_netrwPlugin = 1
	g.loaded_netrwSettings = 1

	-- Disable tohtml.vim
	g.loaded_2html_plugin = 1

	-- Disable zipPlugin.vim, gzip.vim, tarPlugin.vim
	g.loaded_gzip = 1
	g.loaded_tar = 1
	g.loaded_tarPlugin = 1
	g.loaded_vimball = 1
	g.loaded_vimballPlugin = 1
	g.loaded_zip = 1
	g.loaded_zipPlugin = 1

	-- Disable sql omni completion
	g.loaded_sql_completion = 1

	-- Disable remote plugins
	g.loaded_remote_plugins = 1
end

-- Enable <leader> key
function leader_map()
	vim.g.mapleader = " "
	vim.api.nvim_set_keymap("n", " ", "", { noremap = true })
	vim.api.nvim_set_keymap("x", " ", "", { noremap = true })
end

-- Clipboard configurations
function clipboard_config()
	if vim.loop.os_uname().sysname == "Darwin" then
		vim.g.clipboard = {
			name = "macOS-clipboard",
			copy = { ["+"] = "pbcopy", ["*"] = "pbcopy" },
			paste = { ["+"] = "pbpaste", ["*"] = "pbpaste" },
			cache_enabled = 0,
		}
	end
end

-- Load functions
function load_core()
	create_dir()
	disable_plugins()
	leader_map()

	clipboard_config()

	require("core.opts")
	require("core.sets")
	require("core.auto")

	require("core.lazy")

	vim.api.nvim_command("colorscheme tokyonight-night")
end

load_core()
