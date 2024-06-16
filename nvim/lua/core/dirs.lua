-- Variables
local global = require('core.global')

local data_dir = {
    global.cache_dir .. 'backup',
    -- global.cache_dir .. 'session',
    -- global.cache_dir .. 'swap',
    -- global.cache_dir .. 'tags',
    global.cache_dir .. 'undo',
}

-- Check if cache directory does not already exists and create cache directory
if vim.fn.isdirectory(global.cache_dir) == 0 then
    os.execute('mkdir -p ' .. global.cache_dir)
    for _, v in pairs(data_dir) do
        if vim.fn.isdirectory(v) == 0 then
            os.execute('mkdir -p ' .. v)
        end
    end
end
