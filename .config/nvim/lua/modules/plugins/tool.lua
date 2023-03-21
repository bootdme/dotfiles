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
        { 'nvim-telescope/telescope-live-grep-args.nvim' },
    },
}

return tool
