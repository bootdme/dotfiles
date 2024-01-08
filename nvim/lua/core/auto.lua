-- Variables
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Auto close some filetype with <q>
autocmd('FileType', {
    pattern = {
        'help',
        'man',
        'notify',
        'nofile',
        'lspinfo',
        'terminal',
        'toggleterm',
        'startuptime',
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.api.nvim_buf_set_keymap(event.buf, 'n', 'q', '<CMD>close<CR>', { silent = true })
    end,
})

-- Fix fold issue of files opened by telescope
autocmd('BufRead', {
    callback = function()
        autocmd('BufWinEnter', {
            once = true,
            command = 'normal! zx',
        })
    end,
})

-- Auto jump to last place in file
autocmd('BufReadPost', {
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- Highlight on yank
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
    group = 'YankHighlight',
    callback = function()
        vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '1000' })
    end,
})

-- Reload vim config when necessary
autocmd({ 'FocusGained', 'TermClose', 'TermLeave' }, { command = 'checktime' })

-- Don't auto comment new line
autocmd('FileType', { command = [[set formatoptions-=cro]] })
