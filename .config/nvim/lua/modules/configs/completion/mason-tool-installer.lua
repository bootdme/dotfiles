-- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
return function()
    require("mason-tool-installer").setup({
        -- https://github.com/williamboman/mason.nvim/blob/main/PACKAGES.md
        ensure_installed = {
            -- Formatters
            "cbfmt",
            "markdownlint",
            "prettierd",
            "beautysh",
            "shfmt",
            "sql-formatter",
            "stylua",

            -- Linters
            "eslint_d",
            "shellcheck",
            "sqlfluff",
        },

        auto_update = true,
        run_on_start = true,
    })
end
