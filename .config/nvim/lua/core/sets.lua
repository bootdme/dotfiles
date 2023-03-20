local set = require('core.func').set

-- Move to beginning/end of line
set('n', 'H', '^', { desc = 'Beginning of line' })
set('n', 'L', '$', { desc = 'End of line' })

-- Move blocks of code up/down
set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move code down' })
set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move code up' })

-- Keep cursor in-place if below line append to current line when moving
set('n', 'J', 'mzJ`z', { desc = 'Keep cursor inplace' })

-- Never press Q
set('n', 'Q', '<nop>', { desc = 'Never press' })

-- l - lazy
set('n', '<leader>lc', '<cmd>Lazy check<cr>', { desc = 'Lazy check' })
set('n', '<leader>lh', '<cmd>Lazy home<cr>', { desc = 'Lazy home' })
set('n', '<leader>ls', '<cmd>Lazy sync<cr>', { desc = 'Lazy sync' })
set('n', '<leader>ll', '<cmd>Lazy log<cr>', { desc = 'Lazy log' })
set('n', '<leader>lp', '<cmd>Lazy profile<cr>', { desc = 'Lazy profile' })
set('n', '<leader>lu', '<cmd>Lazy update<cr>', { desc = 'Lazy update' })
set('n', '<leader>lx', '<cmd>Lazy clean<cr>', { desc = 'Lazy clean' })

-- f - find
set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { desc = 'Find help' })
set('n', '<leader>fc', '<cmd>Telescope commands<cr>', { desc = 'Find commands' })
set('n', '<leader>fk', '<cmd>Telescope keymaps<cr>', { desc = 'Find keymaps' })
set('n', '<leader>fw', '<cmd>Telescope live_grep_args<cr>', { desc = 'Find word' })
set('n', '<leader>fo', '<cmd>Telescope oldfiles<cr>', { desc = 'Find old files' })
set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Find files' })
set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { desc = 'Find buffer' })
set('n', '<leader>fp', '<cmd>Telescope repo<cr>', { desc = 'Find repo' })
set('n', '<leader>fe', '<cmd>Telescope env<cr>', { desc = 'Find environment' })

-- g - git
set('n', 'gps', '<cmd>G push<cr>', { desc = 'Git Push' })
set('n', 'gpl', '<cmd>G pull<cr>', { desc = 'Git Pull' })
set('n', '<leader>G', '<cmd>G<cr>', { desc = 'Git Fugitive' })
