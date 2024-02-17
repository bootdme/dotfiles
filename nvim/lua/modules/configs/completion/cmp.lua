-- https://github.com/hrsh7th/nvim-cmp
return function()
    local cmp = require('cmp')
    local lspkind = require('lspkind')

    cmp.setup({
        formatting = {
            format = lspkind.cmp_format({
                mode = 'symbol_text',
                maxwidth = 60,
                ellipsis_char = '...',
                before = function(entry, vim_item)
                    vim_item.menu = ({
                        nvim_lsp = '[LSP]',
                        path = '[PATH]',
                    })[entry.source.name]
                    return vim_item
                end,
            }),
        },
        matching = {
            disallow_partial_fuzzy_matching = false,
        },
        performance = {
            async_budget = 1,
            max_view_entries = 60,
        },
        mapping = cmp.mapping.preset.insert({
            ['<CR>'] = cmp.mapping.confirm({ select = false }),
            ['<C-k>'] = cmp.mapping.select_prev_item(),
            ['<C-j>'] = cmp.mapping.select_next_item(),
        }),
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end,
        },
        sources = {
            { name = 'nvim_lsp' },
            { name = 'path' },
        },
    })
end
