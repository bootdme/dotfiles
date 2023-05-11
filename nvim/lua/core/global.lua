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
    'vim',
}

global['lsp'] = {
    'bashls',
    'eslint',
    'null-ls',
    'jsonls',
    'lua_ls',
    'marksman',
    'sqlls',
    'vimls',
}
-- Mason tool installer
-- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
global['lsp_format_lint_dap'] = {
    -- LSPs
    'bash-language-server',
    'eslint-lsp',
    'json-lsp',
    'lua-language-server',
    'rust-analyzer',
    'marksman',
    'sqlls',
    'vim-language-server',

    -- Formatters
    'cbfmt',
    'shfmt',
    'markdownlint',
    'prettierd',
    'rustfmt',
    'sqlfmt',
    'stylua',

    -- Linters
    'selene',
    'shellcheck',
    'eslint_d',
    'sqlfluff',
}

global:load_variables()

return global
