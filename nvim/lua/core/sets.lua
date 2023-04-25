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
set('n', '<leader>fgc', '<cmd>Telescope git_commits<cr>', { desc = 'Find git commits' })
set('n', '<leader>fgs', '<cmd>Telescope git_status<cr>', { desc = 'Find git status' })
set('n', '<leader>fgb', '<cmd>Telescope git_branches<cr>', { desc = 'Find git branches' })

-- g - git
set('n', 'gps', '<cmd>G push<cr>', { desc = 'Git Push' })
set('n', 'gpl', '<cmd>G pull<cr>', { desc = 'Git Pull' })
set('n', '<leader>g', '<cmd>G<cr>', { desc = 'Git Fugitive' })
set('n', '<leader>gc', '<cmd>G commit<cr>', { desc = 'Git commit' })

-- h - hunk
set('n', ']g', '<cmd>Gitsigns next_hunk<cr>', { desc = 'Next hunk' })
set('n', '[g', '<cmd>Gitsigns prev_hunk<cr>', { desc = 'Previous hunk' })
set({ 'n', 'v' }, '<leader>hs', '<cmd>Gitsigns stage_hunk<cr>', { desc = 'Hunk Stage' })
set({ 'n', 'v' }, '<leader>hr', '<cmd>Gitsigns reset_hunk<cr>', { desc = 'Hunk Reset' })
set('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<cr>', { desc = 'Hunk Undo' })
set('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<cr>', { desc = 'Reset buffer' })
set('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<cr>', { desc = 'Hunk Preview' })
set('n', '<leader>hb', '<cmd>lua require("gitsigns.actions").blame_line({ full = true })<cr>', { desc = 'Blame line' })

set('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<cr>', { desc = 'Toggle Deleted' })

-- c - crates
set('n', '<leader>ct', '<cmd>lua require("crates").toggle()<cr>', { desc = 'Crates Toggle' })
set('n', '<leader>cr', '<cmd>lua require("crates").reload()<cr>', { desc = 'Crates Reload' })
set('n', '<leader>cv', '<cmd>lua require("crates").show_versions_popup()<cr>', { desc = 'Crates Versions' })
set('n', '<leader>cf', '<cmd>lua require("crates").show_features_popup()<cr>', { desc = 'Crates Features' })
set('n', '<leader>cd', '<cmd>lua require("crates").show_dependencies_popup()<cr>', { desc = 'Crates Dependencies' })
set('n', '<leader>cu', '<cmd>lua require("crates").update_crate()<cr>', { desc = 'Crates Update' })
set('v', '<leader>cu', '<cmd>lua require("crates").update_crates()<cr>', { desc = 'Crates Update(s)' })
set('n', '<leader>ca', '<cmd>lua require("crates").update_all_crates()<cr>', { desc = 'Crates Update All' })
set('n', '<leader>cU', '<cmd>lua require("crates").upgrade_crate()<cr>', { desc = 'Crates Upgrade' })
set('v', '<leader>cU', '<cmd>lua require("crates").upgrade_crates()<cr>', { desc = 'Crates Upgrade(s)' })
set('n', '<leader>ct', '<cmd>lua require("crates").upgrade_all_crates()<cr>', { desc = 'Crates Upgrade All' })
set('n', '<leader>cH', '<cmd>lua require("crates").open_homepage()<cr>', { desc = 'Crates Homepage' })
set('n', '<leader>cR', '<cmd>lua require("crates").open_repository()<cr>', { desc = 'Crates Repository' })
set('n', '<leader>cD', '<cmd>lua require("crates").open_documentation()<cr>', { desc = 'Crates Documentation' })
set('n', '<leader>cO', '<cmd>lua require("crates").open_crates_io()<cr>', { desc = 'Crates Open Crates' })

-- d - dap
set('n', '<leader>db', '<cmd>DapToggleBreakpoint<cr>')
set('n', '<leader>dr', '<cmd>DapToggleRepl<cr>')
set('n', '<leader>dq', '<cmd>DapTerminate<cr>')
set('n', '<leader>dl', '<cmd>lua require("dap").run_last()<cr>')
set('n', '<F5>', '<cmd>DapContinue<cr>')
set('n', '<F3>', '<cmd>DapStepOver<cr>')
set('n', '<F2>', '<cmd>DapStepInto<cr>')
set('n', '<F12>', '<cmd>DapStepOut<cr>')
set('n', '<leader>dB', '<cmd>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<cr>')
set('n', '<leader>dp', '<cmd>lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<cr>')

-- t - toggle term
set('n', '<leader>tt', '<cmd>ToggleTerm<cr>', { desc = 'Toggle Term' })

-- c - cheatsheet
set('n', '<leader>cs', '<cmd>Cheatsheet<cr>', { desc = 'Cheatsheet' })

-- m - markdown
set('n', '<leader>mp', '<cmd>MarkdownPreviewToggle<cr>', { desc = 'Markdown Preview' })
set('n', '<leader>ms', '<cmd>MarkdownPreviewStop<cr>', { desc = 'Markdown Stop' })

-- u - undo
set('n', '<leader>ut', '<cmd>UndotreeToggle<cr>', { desc = 'Undotree Toggle' })
