-- https://github.com/hrsh7th/nvim-cmp
return function()
    local compare = require('cmp.config.compare')

    local t = function(str)
        return vim.api.nvim_replace_termcodes(str, true, true, true)
    end

    -- Better sort completion
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
                        nvim_lsp = '[LSP]',
                        luasnip = '[LUASNIP]',
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
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        sources = {
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            { name = 'path' },
        },
    })
end
