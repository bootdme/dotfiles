local editor = {}

editor['numToStr/Comment.nvim'] = {
    lazy = true,
    event = { 'BufNewFile', 'BufReadPre' },
    config = require('editor.comment'),
    dependencies = 'nvim-treesitter/nvim-treesitter',
}

return editor
