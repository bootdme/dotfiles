-- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
return function()
    require('mason-tool-installer').setup({
        ensure_installed = require('core.global').mason_installs,
    })
end
