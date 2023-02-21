-- https://github.com/nvim-telescope/telescope.nvim
return function()
	local lga_actions = require("telescope-live-grep-args.actions")

	require("telescope").setup({
		defaults = {
			file_ignore_patterns = {
				".git/",
				".cache",
				"%.pdf",
				"%.mkv",
				"%.mp4",
				"%.zip",
				"node_modules/",
				"target/",
				"docs/",
			},
		},
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		file_sorter = require("telescope.sorters").get_fuzzy_file,
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
		extensions = {
			-- https://github.com/nvim-telescope/telescope-fzf-native.nvim
			fzf = {
				fuzzy = false,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
			-- https://github.com/nvim-telescope/telescope-frecency.nvim
			frecency = {
				show_scores = true,
				show_unindexed = true,
				ignore_patterns = { "*.git/*", "*/tmp/*" },
			},
			-- https://github.com/nvim-telescope/telescope-live-grep-args.nvim
			live_grep_args = {
				auto_quoting = true,
				mappings = {
					i = {
						["<C-k>"] = lga_actions.quote_prompt(),
						["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
					},
				},
			},
		},
	})

	-- Load telescope plugins
	require("telescope").load_extension("env")
	require("telescope").load_extension("fzf")
	require("telescope").load_extension("frecency")
	require("telescope").load_extension("live_grep_args")
end
