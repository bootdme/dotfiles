return function()
    require('fidget').setup({
        progress = {
            ignore_done_already = false,
            ignore = { 'null-ls' },
            display = {
                render_limit = 5,
                done_ttl = 2,
            },
        },
    })
end
