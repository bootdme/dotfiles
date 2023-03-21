local lang = {}

lang['iamcco/markdown-preview.nvim'] = {
    lazy = true,
    ft = 'markdown',
    build = ':call mkdp#util#install()',
    config = require('lang.markdown-preview'),
}

lang['chrisbra/csv.vim'] = {
    lazy = true,
    ft = 'csv',
}

return lang
