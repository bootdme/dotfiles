local global = {}

-- https://github.com/CharlesChiuGit/nvimdots.lua/blob/main/lua/core/global.lua
function global:load_variables()
    local home = os.getenv('HOME')
    local path_sep = '/'

    self.vim_path = vim.fn.stdpath('config')

    self.cache_dir = home .. path_sep .. '.cache' .. path_sep .. 'nvim' .. path_sep
    self.modules_dir = self.vim_path .. path_sep .. 'modules'
    self.home = home
    self.data_dir = string.format('%s/site/', vim.fn.stdpath('data'))
end

-- Treesitter variables
-- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
global['ts'] = {
    'bash',
    'css',
    'fish',
    'gitignore',
    'html',
    'javascript',
    'jsonc',
    'lua',
    'markdown',
    'markdown_inline',
    'regex',
    'rust',
    'sql',
}

global['lsp'] = {
    'lua_ls',
}

-- Mason tool installer
-- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
global['mason_installs'] = {
    -- LSPs
    'lua-language-server',
    'rust-analyzer',

    -- Formatters
    'stylua',

    -- Linters
    'selene',
}

global:load_variables()

return global
