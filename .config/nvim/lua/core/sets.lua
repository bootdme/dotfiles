local set = require('core.func').set

-- Move to beginning/end of line
set('n', 'H', '^')
set('n', 'L', '$')

-- Move blocks of code up/down
set('v', 'J', ":m '>+1<CR>gv=gv")
set('v', 'K', ":m '<-2<CR>gv=gv")

-- Smarter indenting
set('v', '>', '>gv')
set('v', '<', '<gv')

-- Keep cursor in-place if below line append to current line when moving
set('n', 'J', 'mzJ`z')

-- Never press Q
set('n', 'Q', '<nop>')

-- l - lazy
set('n', '<leader>lc', '<cmd>Lazy check<cr>')
set('n', '<leader>lh', '<cmd>Lazy home<cr>')
set('n', '<leader>ls', '<cmd>Lazy sync<cr>')
set('n', '<leader>ll', '<cmd>Lazy log<cr>')
set('n', '<leader>lp', '<cmd>Lazy profile<cr>')
set('n', '<leader>lu', '<cmd>Lazy update<cr>')
set('n', '<leader>lx', '<cmd>Lazy clean<cr>')

-- d - debug
set('n', '<leader>db', '<cmd>debug: Toggle breakpoint<cr>')
set('n', '<leader>dbl', '<cmd>debug: List breakpoint(s)<cr>')
