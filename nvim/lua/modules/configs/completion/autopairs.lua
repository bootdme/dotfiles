-- https://github.com/windwp/nvim-autopairs
return function()
    require('nvim-autopairs').setup({
        -- Enable treesitter
        check_ts = true,
        ts_config = {
            -- Don't add pairs in lua string treesitter nodes
            lua = { 'string' },
            -- Don't add pairs in javascript template_string treesitter nodes
            javascript = { 'template_string' },
            -- Don't check treesitter on java
            java = false,
        },
        disable_filetype = { 'TelescopePrompt', 'vim' },
    })

    -- If you want insert `(` after select function or method item
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp')
    local handlers = require('nvim-autopairs.completion.handlers')

    cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done({
            filetypes = {
                -- "*" is an alias to all filetypes
                ['*'] = {
                    ['('] = {
                        kind = {
                            cmp.lsp.CompletionItemKind.Function,
                            cmp.lsp.CompletionItemKind.Method,
                        },
                        handler = handlers['*'],
                    },
                },
                -- Disable for tex
                tex = false,
            },
        })
    )
end
