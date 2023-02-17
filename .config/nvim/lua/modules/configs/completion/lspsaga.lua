-- https://github.com/glepnir/lspsaga.nvim
return function()
	require("lspsaga").setup({
		-- Mostly all are default options, but here to view
		finder = {
			max_height = 0.5,
			keys = {
				jump_to = "p",
				edit = { "o", "<CR>" },
				vsplit = "s",
				split = "i",
				tabe = "t",
				tabnew = "r",
				quit = { "q", "<ESC>" },
				close_in_preview = "<ESC>",
			},
		},
		definition = {
			edit = "<C-c>o",
			vsplit = "<C-c>v",
			split = "<C-c>i",
			tabe = "<C-c>t",
			quit = "q",
			close = "<Esc>",
		},
		code_action = {
			num_shortcut = true,
			show_server_name = false,
			extend_gitsigns = true,
			keys = {
				-- string | table type
				quit = "q",
				exec = "<CR>",
			},
		},
		lightbulb = {
			enable = false,
			enable_in_insert = true,
			sign = true,
			sign_priority = 40,
			virtual_text = true,
		},
		diagnostic = {
			show_code_action = true,
			show_source = true,
			jump_num_shortcut = true,
			--1 is max
			max_width = 0.7,
			custom_fix = nil,
			custom_msg = nil,
			text_hl_follow = false,
			border_follow = true,
			keys = {
				exec_action = "o",
				quit = "q",
				go_action = "g",
			},
		},
		rename = {
			quit = "<C-c>",
			mark = "x",
			confirm = "<CR>",
			exec = "<CR>",
			in_select = true,
		},
		outline = {
			win_position = "right",
			win_with = "_sagaoutline",
			win_width = 30,
			auto_preview = false,
			auto_refresh = true,
			auto_close = true,
			keys = {
				jump = "<CR>",
				expand_collapse = "u",
				quit = "q",
			},
		},
		symbol_in_winbar = {
			enable = false,
			separator = "  ",
			hide_keyword = true,
			show_file = false,
			color_mode = true,
		},
		beacon = {
			enable = true,
			frequency = 12,
		},
	})
end
