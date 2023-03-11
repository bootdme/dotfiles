local tool = {}

tool['folke/trouble.nvim'] = {
    lazy = true,
    cmd = { 'Trouble', 'TroubleToggle', 'TroubleRefresh' },
    config = require('tool.trouble'),
}

return tool
