-- https://github.com/norcalli/nvim-colorizer.lua
return function()
    require('colorizer').setup({ { '*' }, { names = false } })

    vim.defer_fn(function()
        require('colorizer').attach_to_buffer(0)
    end, 0)
end
