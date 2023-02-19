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
