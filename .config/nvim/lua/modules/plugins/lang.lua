local lang = {}

lang['iamcco/markdown-preview.nvim'] = {
    lazy = true,
    ft = 'markdown',
    build = ':call mkdp#util#install()',
    config = require('lang.markdown-preview'),
}

return lang
