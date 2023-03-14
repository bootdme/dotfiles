-- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
return function()
    require('mason-tool-installer').setup({
        ensure_installed = require('core.global').lsp_format_lint_dap,

        -- Check each tool for updates
        auto_update = true,

        -- Automatically install / update on startup
        run_on_start = true,

        -- Set a delay before the installation starts (fixes treesitter load)
        start_delay = 2000,
    })
end
