-- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
return function()
    require('mason-tool-installer').setup({
        ensure_installed = require('core.global').lsp_format_lint,

        -- Check each tool for updates
        auto_update = true,

        -- Automatically install / update on startup
        run_on_start = true,

        -- Set a delay before the installation starts
        start_delay = 1000,
    })
end
