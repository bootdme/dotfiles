local editor = {}

editor['s1n7ax/nvim-comment-frame'] = {
    lazy = true,
    event = { 'BufNewFile', 'BufReadPre' },
    config = require('editor.comment-frame'),
    dependencies = 'nvim-treesitter/nvim-treesitter',
}

editor['numToStr/Comment.nvim'] = {
    lazy = true,
    event = { 'BufNewFile', 'BufReadPre' },
    config = require('editor.comment'),
    dependencies = 'nvim-treesitter/nvim-treesitter',
}

return editor
