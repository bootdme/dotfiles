local tool = {}

tool['tpope/vim-fugitive'] = {
    lazy = true,
    cmd = { 'Git', 'G' },
}

tool['mbbill/undotree'] = {
    lazy = true,
    cmd = 'UndotreeToggle',
}

tool['dstein64/vim-startuptime'] = {
    lazy = true,
    cmd = 'StartupTime',
}

tool['sudormrfbin/cheatsheet.nvim'] = {
    lazy = true,
    cmd = 'Cheatsheet',
    config = require('tool.cheatsheet'),
    dependencies = {
        { 'nvim-telescope/telescope.nvim' },
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-lua/popup.nvim' },
    },
}

tool['tpope/vim-dadbod'] = {
    lazy = true,
    cmd = { 'DBUI', 'DBUIFindBuffer', 'DBUIAddConnection' },
    dependencies = {
        { 'kristijanhusak/vim-dadbod-ui' },
        {
            'lifepillar/pgsql.vim',
            config = function()
                vim.g.sql_type_default = 'pgsql'
            end,
            ft = 'sql',
        },
    },
}

tool['nvim-telescope/telescope.nvim'] = {
    lazy = true,
    cmd = 'Telescope',
    config = require('tool.telescope'),
    dependencies = {
        { 'nvim-tree/nvim-web-devicons' },
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-lua/popup.nvim' },
        { 'LinArcX/telescope-env.nvim' },
        { 'cljoly/telescope-repo.nvim' },
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        { 'nvim-telescope/telescope-live-grep-args.nvim' },
    },
}

return tool
