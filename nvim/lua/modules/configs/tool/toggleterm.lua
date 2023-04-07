return function()
    require('toggleterm').setup({
        size = function(term)
            if term.direction == 'horizontal' then
                return 15
            elseif term.direction == 'vertical' then
                return vim.o.columns * 0.35
            end
        end,
        on_open = function()
            vim.api.nvim_set_option_value('foldmethod', 'manual', { scope = 'local' })
            vim.api.nvim_set_option_value('foldexpr', '0', { scope = 'local' })
        end,
        hide_numbers = true,
        close_on_exit = true,
        direction = 'horizontal',
        shell = '/opt/homebrew/bin/fish', -- or
    })
end
