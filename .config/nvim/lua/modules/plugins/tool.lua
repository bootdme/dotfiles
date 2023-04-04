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

tool['folke/trouble.nvim'] = {
    lazy = true,
    cmd = { 'Trouble', 'TroubleToggle', 'TroubleRefresh' },
    config = require('tool.trouble'),
}

tool['tpope/vim-dadbod'] = {
    lazy = true,
    cmd = { 'DBUI', 'DBUIFindBuffer', 'DBUIAddConnection' },
    dependencies = {
        { 'kristijanhusak/vim-dadbod-ui' },
    },
}

tool['mfussenegger/nvim-dap'] = {
    lazy = true,
    cmd = {
        'DapSetLogLevel',
        'DapShowLog',
        'DapContinue',
        'DapToggleBreakpoint',
        'DapToggleRepl',
        'DapStepOver',
        'DapStepInto',
        'DapStepOut',
        'DapTerminate',
    },
    config = require('tool.dap'),
    dependencies = {
        { 'rcarriga/nvim-dap-ui' },
        { 'mxsdev/nvim-dap-vscode-js' },
        { 'theHamsta/nvim-dap-virtual-text' },
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
