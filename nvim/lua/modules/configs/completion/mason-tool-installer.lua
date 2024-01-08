-- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
return function()
    require('mason-tool-installer').setup({
        auto_update = true,
        ensure_installed = require('core.global').mason_installs,
    })
end
