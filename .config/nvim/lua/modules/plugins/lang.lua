local lang = {}

lang['chrisbra/csv.vim'] = {
    lazy = true,
    ft = 'csv',
}

lang['simrat39/rust-tools.nvim'] = {
    lazy = true,
    ft = 'rust',
    config = require('lang.rust-tools'),
    dependencies = { 'nvim-lua/plenary.nvim' },
}

return lang
