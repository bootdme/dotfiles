local ui = {}

ui['folke/tokyonight.nvim'] = {
    lazy = true,
    name = 'tokyonight',
}

ui['ellisonleao/gruvbox.nvim'] = {
    lazy = true,
    name = 'gruvbox',
}

ui['nvim-treesitter/nvim-treesitter'] = {
    lazy = true,
    build = function()
        if #vim.api.nvim_list_uis() ~= 0 then
            vim.api.nvim_command('TSUpdate')
        end
    end,
    event = 'BufReadPre',
    config = require('ui.treesitter'),
    dependencies = {
        { 'neovim/nvim-lspconfig' },
        { 'nushell/tree-sitter-nu', ft = 'nu' },
    },
}

return ui
