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
    'gitignore',
    'html',
    'javascript',
    'jsonc',
    'lua',
    'markdown',
    'markdown_inline',
    'nu',
    'regex',
    'rust',
    'sql',
    'vimdoc',
}

-- LSP variables
global['lsp'] = {
    'lua_ls',
    'bashls',
}

-- Mason tool installer
-- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
global['mason_installs'] = {
    -- LSPs
    'lua-language-server',
    'bash-language-server',

    -- Formatters
    'stylua',
    'shfmt',

    -- Linters
    'selene',
    'shellcheck',
}

global:load_variables()

return global
