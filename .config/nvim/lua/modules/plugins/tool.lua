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
        { 'nvim-telescope/telescope-live-grep-args.nvim' },
    },
}

tool['mfussenegger/nvim-dap'] = {
    lazy = true,
    cmd = {
        'Dap',
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
        { 'theHamsta/nvim-dap-virtual-text' },
        { 'jbyuki/one-small-step-for-vimkind' },
    },
}

tool['folke/which-key.nvim'] = {
    event = 'VeryLazy',
}

return tool
