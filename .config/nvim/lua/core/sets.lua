-- Variables
local set = vim.keymap.set
local opts = { noremap = true, silent = true, nowait = true }

-- Move to beginning/end of line
set("n", "H", "^", opts)
set("n", "L", "$", opts)

-- Move blocks of code up/down
set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

-- Enable folding
set("n", "F", "za", opts)

-- Smarter indenting
set("v", ">", ">gv|", opts)
set("v", "<", "<gv", opts)

-- Select all
set("n", "<C-a>", "gg<S-v>G", opts)

-- Keep cursor in-place if below line append to current line when moving
set("n", "J", "mzJ`z")

-- Better Ctrl+D/U
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")

-- Search and highlight
set("n", "n", "nzzzv", opts)
set("n", "N", "Nzzzv", opts)
set("n", "*", "*zzzv", opts)
set("n", "#", "#zzzv", opts)
set("n", "<esc>", "<cmd>noh<cr>", opts)

-- Never press Q
set("n", "Q", "<nop>")

-- Make Ascii art font
set("n", "<leader>aA", "<cmd>.!toilet -w 204 -f standard<cr>", opts)
set("n", "<leader>aa", "<cmd>.!toilet -w 204 -f small<cr>", opts)
-- Make Ascii border
set("n", "<leader>ab", "<cmd>.!toilet -f term -F border<cr>", opts)
-- ┌────┐
-- │test│
-- └────┘
