-- https://github.com/lukas-reineke/indent-blankline.nvim
return function()
    require('indent_blankline').setup({
        char = '│',
        show_first_indent_level = true,
        filetype_exclude = {
            '', -- for all buffers without a file type
            'TelescopePrompt',
            'dashboard',
            'git',
            'gitcommit',
            'help',
            'json',
            'log',
            'markdown',
            'nu',
            'txt',
            'toml',
            'text',
        },
        buftype_exclude = { 'terminal', 'nofile' },
        show_trailing_blankline_indent = false,
        show_current_context = true,
        space_char_blankline = ' ',
    })
end
