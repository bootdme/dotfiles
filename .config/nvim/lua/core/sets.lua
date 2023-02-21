-- Variables
local set = require("core.func").set

-- Move to beginning/end of line
set("n", "H", "^")
set("n", "L", "$")

-- Move blocks of code up/down
set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

-- Smarter indenting
set("v", ">", ">gv|")
set("v", "<", "<gv")

-- Select all
set("n", "<C-a>", "gg<S-v>G")

-- Keep cursor in-place if below line append to current line when moving
set("n", "J", "mzJ`z")

-- Keep in paste register
set("x", "<leader>p", '"_dP')

-- Better yank
set("n", "<leader>y", '"+y')
set("v", "<leader>y", '"+y')
set("n", "<leader>Y", '"+Y')

-- Search and highlight
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")
set("n", "*", "*zzzv")
set("n", "#", "#zzzv")
set("n", "<esc>", "<cmd>noh<cr>")

-- Never press Q
set("n", "Q", "<nop>")

-- Make Ascii art font
set("n", "<leader>aA", "<cmd>.!toilet -w 206 -f standard<cr>")
set("n", "<leader>aa", "<cmd>.!toilet -w 206 -f small<cr>")
-- Make Ascii border
set("n", "<leader>ab", "<cmd>.!toilet -f term -F border<cr>")
-- ┌────┐
-- │test│
-- └────┘

-- f - find
set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
set("n", "<leader>fc", "<cmd>Telescope commands<cr>")
set("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>")
set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
set("n", "<leader>fg", "<cmd>Telescope live_grep_args<cr>")
set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>")
set("n", "<leader>fl", "<cmd>Telescope resume<cr>")
set("n", "<leader>fm", "<cmd>Telescope man_pages<cr>")
set("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>")
set("n", "<leader>fr", "<cmd>Telescope frecency<cr>")
set("n", "<leader>fs", "<cmd>Telescope colorscheme<cr>")
set("n", "<leader>fw", "<cmd>Telescope grep_string<cr>")

-- g - git
set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>")
set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>")
set("n", "<leader>go", "<cmd>Telescope git_status<cr>")

-- l - lazy
set("n", "<leader>lc", "<cmd>Lazy check<cr>")
set("n", "<leader>lh", "<cmd>Lazy home<cr>")
set("n", "<leader>ls", "<cmd>Lazy sync<cr>")
set("n", "<leader>ll", "<cmd>Lazy log<cr>")
set("n", "<leader>lp", "<cmd>Lazy profile<cr>")
set("n", "<leader>lu", "<cmd>Lazy update<cr>")
set("n", "<leader>lx", "<cmd>Lazy clean<cr>")

-- t - trouble
set("n", "<leader>tt", "<cmd>TroubleToggle<cr>")
set("n", "<leader>tr", "<cmd>TroubleToggle lsp_references<cr>")
set("n", "<leader>td", "<cmd>TroubleToggle document_diagnostics<cr>")
set("n", "<leader>tq", "<cmd>TroubleToggle quickfix<cr>")
set("n", "<leader>tl", "<cmd>TroubleToggle loclist<cr>")
