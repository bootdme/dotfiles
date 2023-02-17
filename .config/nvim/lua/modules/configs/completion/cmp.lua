-- https://github.com/hrsh7th/nvim-cmp
return function()
	local compare = require("cmp.config.compare")

	compare.lsp_scores = function(entry1, entry2)
		local diff
		if entry1.completion_item.score and entry2.completion_item.score then
			diff = (entry2.completion_item.score * entry2.score) - (entry1.completion_item.score * entry1.score)
		else
			diff = entry2.score - entry1.score
		end
		return (diff < 0)
	end

	local cmp = require("cmp")

    cmp.setup({
        sorting = {
            priority_weight = 2,
            comparators = {
                compare.locality,
                compare.lsp_scores,
                compare.offset,
                compare.order,
                compare.sort_text,
                compare.exact,
                compare.kind,
                compare.length,
            },
        },
		mapping = cmp.mapping.preset.insert({
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<C-k>"] = cmp.mapping.select_prev_item(),
			["<C-j>"] = cmp.mapping.select_next_item(),
			["<C-d>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-e>"] = cmp.mapping.close(),
			["<C-c>"] = cmp.mapping({
				i = cmp.mapping.abort(),
				c = cmp.mapping.close(),
			}),
		}),
		snippet = {
			expand = function(args)
                -- https://github.com/L3MON4D3/LuaSnip
				require("luasnip").lsp_expand(args.body)
			end,
		},
		sources = {
			{ name = "nvim_lsp" },
			{ name = "nvim_lua" },
			{ name = "luasnip" },
			{ name = "path" },
			{ name = "fish" },
			{ name = "buffer" },
			{ name = "treesitter" },
		},
    })

end
