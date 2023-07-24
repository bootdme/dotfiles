-- https://github.com/nvim-telescope/telescope.nvim
return function()
    local lga_actions = require('telescope-live-grep-args.actions')

    require('telescope').setup({
        defaults = {
            vimgrep_arguments = {
                'rg',
                '-L',
                '--color=never',
                '--no-heading',
                '--with-filename',
                '--line-number',
                '--column',
                '--smart-case',
            },
            layout_strategy = 'horizontal',
            layout_config = {
                horizontal = {
                    prompt_position = 'bottom',
                    preview_width = 0.55,
                    results_width = 0.8,
                },
                vertical = {
                    mirror = false,
                },
                width = 0.87,
                height = 0.80,
                preview_cutoff = 120,
            },
            prompt_prefix = '   ',
            dynamic_preview_title = true,
            winblend = 4,
            file_ignore_patterns = {
                '.cache',
                '.local',
                '%.pdf',
                '%.mkv',
                '%.mp4',
                '%.zip',
                'node_modules/',
            },
        },
        extensions = {
            fzf = {
                fuzzy = false,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = 'smart_case',
            },
            live_grep_args = {
                auto_quoting = true, -- enable/disable auto-quoting
                -- define mappings, e.g.
                mappings = { -- extend mappings
                    i = {
                        ['<C-k>'] = lga_actions.quote_prompt(),
                        ['<C-i>'] = lga_actions.quote_prompt({ postfix = ' --iglob ' }),
                    },
                },
            },
        },
    })

    require('telescope').load_extension('env')
    require('telescope').load_extension('fzf')
    require('telescope').load_extension('live_grep_args')
end
