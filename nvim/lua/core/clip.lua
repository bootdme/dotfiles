-- macOS clipboard
if vim.loop.os_uname().sysname == 'Darwin' then
    vim.g.clipboard = {
        name = 'macOS-clipboard',
        copy = { ['+'] = 'pbcopy', ['*'] = 'pbcopy' },
        paste = { ['+'] = 'pbpaste', ['*'] = 'pbpaste' },
        cache_enabled = true,
    }

-- Fedora clipboard
else
    vim.g.clipboard = {
        name = 'Fedora clipboard',
        copy = { ['+'] = 'xclip -i selection clipboard', ['*'] = 'xclip -i selection clipboard' },
        paste = { ['+'] = 'xclip -o selection clipboard', ['*'] = 'xclip -o selection clipboard' },
        cache_enabled = true,
    }
end
