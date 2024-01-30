local tool = {}

tool['ThePrimeagen/harpoon'] = {
    -- lazy = true,
    branch = 'harpoon2',
    config = require('tool.harpoon'),
    dependencies = { 'nvim-lua/plenary.nvim' },
}

return tool
