local tool = {}

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
        {
            'rcarriga/nvim-dap-ui',
            config = require('tool.dap.dapui'),
        },
        { 'theHamsta/nvim-dap-virtual-text', config = require('tool.dap.dap-virtual-text') },
        { 'jbyuki/one-small-step-for-vimkind' },
    },
}

return tool
