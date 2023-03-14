return function()
    require('telescope').setup({
        defaults = {
            vimgrep_arguments = {
                'rg',
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
            winblend = 0,
            file_ignore_patterns = {
                '.cache',
                '.local',
                '%.class',
                '%.pdf',
                '%.mkv',
                '%.mp4',
                '%.zip',
                'node_modules/',
                'target/',
                'docs/',
            },
        },
        extensions = {
            fzf = {
                fuzzy = false,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = 'smart_case',
            },
            frecency = {
                show_scores = true,
                show_unindexed = true,
                ignore_patterns = { '*.git/*', '*/tmp/*' },
                disable_devicons = false,
                workspaces = {
                    ['conf'] = '/Users/bootdme/.config' or '/home/bootdme/.config',
                    ['data'] = '/Users/bootdme/.local/share' or '/home/bootdme/.local/share',
                },
            },
        },
    })

    require('telescope').load_extension('env')
    require('telescope').load_extension('frecency')
    require('telescope').load_extension('fzf')
    require('telescope').load_extension('repo')
end
