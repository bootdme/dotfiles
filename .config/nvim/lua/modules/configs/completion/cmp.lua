-- https://github.com/hrsh7th/nvim-cmp
return function()
    local compare = require('cmp.config.compare')
    local t = require('core.func').t

    compare.lsp_scores = function(entry1, entry2)
        local diff

        if entry1.completion_item.score and entry2.completion_item.score then
            diff = (entry2.completion_item.score * entry2.score) - (entry1.completion_item.score * entry1.score)
        else
            diff = entry2.score - entry1.score
        end

        return (diff < 0)
    end

    local cmp = require('cmp')
    local lspkind = require('lspkind')

    cmp.setup({
        sorting = {
            priority_weight = 2,
            comparators = {
                compare.offset,
                compare.exact,
                compare.lsp_scores,
                compare.score,
                require('cmp-under-comparator').under,
                compare.kind,
                compare.sort_text,
                compare.length,
                compare.order,
            },
        },
        formatting = {
            format = lspkind.cmp_format({
                mode = 'symbol_text',
                maxwidth = 60,
                ellipsis_char = '...',
                before = function(entry, vim_item)
                    vim_item.menu = ({
                        buffer = '[BUF]',
                        nvim_lsp = '[LSP]',
                        nvim_lua = '[LUA]',
                        path = '[PATH]',
                        fish = '[FISH]',
                        luasnip = '[SNIP]',
                        treesitter = '[TS]',
                    })[entry.source.name]
                    return vim_item
                end,
            }),
        },
        mapping = cmp.mapping.preset.insert({
            ['<CR>'] = cmp.mapping.confirm({ select = false }),
            ['<C-k>'] = cmp.mapping.select_prev_item(),
            ['<C-j>'] = cmp.mapping.select_next_item(),
            ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
            ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
            ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
            ['<C-e>'] = cmp.mapping({
                i = cmp.mapping.abort(),
                c = cmp.mapping.close(),
            }),
            ['<Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif require('luasnip').expand_or_jumpable() then
                    vim.fn.feedkeys(t('<Plug>luasnip-expand-or-jump'), '')
                else
                    fallback()
                end
            end, { 'i', 's' }),
            ['<S-Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif require('luasnip').jumpable(-1) then
                    vim.fn.feedkeys(t('<Plug>luasnip-jump-prev'), '')
                else
                    fallback()
                end
            end, { 'i', 's' }),
        }),
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end,
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        sources = {
            { name = 'nvim_lsp' },
            { name = 'nvim_lua' },
            { name = 'luasnip' },
            { name = 'path' },
            { name = 'fish' },
            { name = 'buffer' },
            { name = 'treesitter' },
        },
    })
end
