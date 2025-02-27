-- Variables

-- Get key-value options for mappings
local get_map_options = function(custom_options)
    local options = { noremap = true, silent = true }

    if custom_options then
        options = vim.tbl_extend('force', options, custom_options)
    end

    return options
end

-- Set key mappings in Neovim
local set = function(mode, target, source, opts)
    vim.keymap.set(mode, target, source, get_map_options(opts))
end

-- Move to beginning/end of line
set('n', 'H', '^', { desc = 'Beginning of line' })
set('n', 'L', '$', { desc = 'End of line' })

-- Move blocks of code up/down
set('x', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move code down' })
set('x', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move code up' })

-- Never press Q
set('n', 'Q', '<nop>', { desc = 'Never press' })

-- l - lazy
set('n', '<leader>lp', '<cmd>Lazy profile<cr>', { desc = 'Lazy profile' })
set('n', '<leader>lu', '<cmd>Lazy update<cr>', { desc = 'Lazy update' })
set('n', '<leader>lh', '<cmd>Lazy home<cr>', { desc = 'Lazy home' })
