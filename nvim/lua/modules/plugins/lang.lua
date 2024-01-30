local lang = {}

lang['iamcco/markdown-preview.nvim'] = {
    lazy = true,
    ft = 'markdown',
    build = function()
        vim.fn['mkdp#util#install']()
    end,
    config = require('lang.markdown-preview'),
}

lang['mrcjkb/rustaceanvim'] = {
    lazy = true,
    version = '^4',
    ft = { 'rust', 'rs' },
}

return lang
