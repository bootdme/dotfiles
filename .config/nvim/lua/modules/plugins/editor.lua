local editor = {}

editor['LunarVim/bigfile.nvim'] = {
    lazy = false,
    config = require('editor.bigfile'),
}

editor['numToStr/Comment.nvim'] = {
    lazy = true,
    event = { 'BufNewFile', 'BufReadPre' },
    config = require('editor.comment'),
    dependencies = 'nvim-treesitter/nvim-treesitter',
}

return editor
