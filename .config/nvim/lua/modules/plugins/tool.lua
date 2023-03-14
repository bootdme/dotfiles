local tool = {}

tool['nvim-telescope/telescope.nvim'] = {
    lazy = true,
    cmd = 'Telescope',
    config = require('tool.telescope'),
    dependencies = {
        { 'nvim-tree/nvim-web-devicons' },
        { 'nvim-lua/plenary.nvim' },
        { 'LinArcX/telescope-env.nvim' },
        { 'cljoly/telescope-repo.nvim' },
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        { 'nvim-telescope/telescope-frecency.nvim', dependencies = { { 'kkharji/sqlite.lua' } } },
    },
}

return tool
