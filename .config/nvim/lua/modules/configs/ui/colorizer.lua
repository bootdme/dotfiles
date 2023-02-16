return function()
    require("colorizer").setup({
        filetypes = { "*" },
        default_options = {
            rgb_fn = true, -- CSS rgb() and rgba() functions
			hsl_fn = true, -- CSS hsl() and hsla() functions
			css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        },
        buftypes = { "*", },
    })
end
