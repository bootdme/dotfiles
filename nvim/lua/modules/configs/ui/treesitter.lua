-- https://github.com/nvim-treesitter/nvim-treesitter
return function()
    require('nvim-treesitter.configs').setup({
        -- A list of parser names that should be installed
        ensure_installed = require('core.global').ts,

        -- Install parsers asynchronously
        sync_install = false,

        -- Automaticaly install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,

        highlight = {
            enable = true,
            disable = function(_, bufnr)
                -- Disable on large files
                return vim.api.nvim_buf_line_count(bufnr) > 5000
                    -- Disable on files with long lines
                    or vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1]:len() > 500
            end,
        },

        indent = { enable = true },
        matchup = { enable = true },

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = { 'markdown' },
    })

    require('nvim-treesitter.install').prefer_git = true
end
