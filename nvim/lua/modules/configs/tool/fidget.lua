return function()
    require('fidget').setup({
        progress = {
            ignore = { 'null-ls' },
        },
    })
end
