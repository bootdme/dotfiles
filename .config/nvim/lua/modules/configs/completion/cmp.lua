-- https://github.com/hrsh7th/nvim-cmp
return function()
	local compare = require("cmp.config.compare")

	local t = function(str)
		return vim.api.nvim_replace_termcodes(str, true, true, true)
	end

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
	local lspkind = require("lspkind")

	cmp.setup({
		sorting = {
			comparators = {
				compare.offset,
				compare.exact,
				compare.lsp_scores,
				compare.under,
				compare.kind,
				compare.sort_text,
				compare.length,
				compare.order,
			},
		},
		confirm_opts = {
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		},
		formatting = {
			fields = { "kind", "abbr", "menu" },
			format = function(entry, vim_item)
				local kind = lspkind.cmp_format({
					mode = "symbol_text",
					maxwidth = 50,
				})(entry, vim_item)
				local strings = vim.split(kind.kind, "%s", { trimempty = true })
				kind.kind = " " .. strings[1] .. " "
				kind.menu = "    (" .. strings[2] .. ")"
				return kind
			end,
		},
		mapping = cmp.mapping.preset.insert({
			["<C-k>"] = cmp.mapping.select_prev_item(),
			["<C-j>"] = cmp.mapping.select_next_item(),
			["<C-d>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<C-e>"] = cmp.mapping({
				i = cmp.mapping.abort(),
				c = cmp.mapping.close(),
			}),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif require("luasnip").expand_or_jumpable() then
					vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
				else
					fallback()
				end
			end, { "i", "s" }),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif require("luasnip").jumpable(-1) then
					vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
				else
					fallback()
				end
			end, { "i", "s" }),
		}),
		snippet = {
			expand = function(args)
				-- https://github.com/L3MON4D3/LuaSnip
				require("luasnip").lsp_expand(args.body)
			end,
		},
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
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
