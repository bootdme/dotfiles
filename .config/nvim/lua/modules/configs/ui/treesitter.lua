return function()
    require("nvim-treesitter.configs").setup({
        ensure_installed = {
			"bash",
			"css",
            "fish",
			"gitignore",
			"help",
			"html",
			"javascript",
			"jsonc",
			"lua",
			"markdown",
			"markdown_inline",
			"regex",
            "sql",
			"vim",
        },

        -- Install parsers asynchronously
        sync_install = true,

        highlight = {
            enable = true,

            -- Disable treesitter highlight for large files
            disable = function(lang, buf)
                local max_filesize = 100 * 1024
                local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))

                if ok and stats and stats.size > max_filesize then
                    return true
                end
            end,
        },

        -- Dependencies
        matchup = { enable = true },
    })

    require("nvim-treesitter.install").prefer_git = true
end
