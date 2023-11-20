local M = {}

local api = vim.api

local get_map_options = function(custom_options)
    local options = { noremap = true, silent = true }

    if custom_options then
        options = vim.tbl_extend('force', options, custom_options)
    end

    return options
end

M.set = function(mode, target, source, opts)
    vim.keymap.set(mode, target, source, get_map_options(opts))
end

M.t = function(str)
    return api.nvim_replace_termcodes(str, true, true, true)
end

return M
