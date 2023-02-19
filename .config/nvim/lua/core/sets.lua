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

-- Telescope
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
set("n", "<leader>fr", "<cmd>Telescope registers<cr>")
set("n", "<leader>fs", "<cmd>Telescope colorscheme<cr>")
set("n", "<leader>fw", "<cmd>Telescope grep_string<cr>")
