-- https://github.com/L3MON4D3/LuaSnip
return function()
    require('luasnip').config.set_config({
        history = true,
        updateevents = 'TextChanged,TextChangedI',
        delete_check_events = 'TextChanged,InsertLeave',
        enable_autosnippets = true,
    })

    require('luasnip.loaders.from_lua').lazy_load()
    require('luasnip.loaders.from_vscode').lazy_load()
    require('luasnip.loaders.from_snipmate').lazy_load()
end
