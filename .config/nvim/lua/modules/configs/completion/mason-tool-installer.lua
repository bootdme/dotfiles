-- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
return function()
    require('mason-tool-installer').setup({
        ensure_installed = require('core.global').lsp_format_lint_dap,
    })
end
