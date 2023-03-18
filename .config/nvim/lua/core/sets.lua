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

-- f - find
set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
set('n', '<leader>fc', '<cmd>Telescope commands<cr>')
set('n', '<leader>fk', '<cmd>Telescope keymaps<cr>')
set('n', '<leader>fw', '<cmd>Telescope live_grep_args<cr>')
set('n', '<leader>fo', '<cmd>Telescope oldfiles<cr>')
set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
set('n', '<leader>fs', '<cmd>Telescope grep_string<cr>')
set('n', '<leader>fp', '<cmd>Telescope repo<cr>')
set('n', '<leader>fe', '<cmd>Telescope env<cr>')

-- d - dap
set('n', '<leader>db', '<cmd>DapToggleBreakpoint<cr>')
set('n', '<leader>dr', '<cmd>DapToggleRepl<cr>')
set('n', '<leader>dq', '<cmd>DapTerminate<cr>')
set('n', '<leader>dl', '<cmd>lua require("dap").run_last()<cr>')
set('n', '<F5>', '<cmd>DapContinue<cr>')
set('n', '<F10>', '<cmd>DapStepOver<cr>')
set('n', '<F11>', '<cmd>DapStepInto<cr>')
set('n', '<F12>', '<cmd>DapStepOut<cr>')
set('n', '<leader>dB', '<cmd>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<cr>')
set('n', '<leader>dp', '<cmd>lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<cr>')
