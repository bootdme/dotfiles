local api = vim.api

local get_map_options = function(custom_options)
	local options = { silent = true }
	if custom_options then
		options = vim.tbl_extend("force", options, custom_options)
	end
	return options
end

local M = {}

M.map = function(mode, target, source, opts)
	vim.keymap.set(mode, target, source, get_map_options(opts))
end

for _, mode in ipairs({ "n", "o", "i", "x", "t", "c" }) do
	M[mode .. "map"] = function(...)
		M.map(mode, ...)
	end
end

M.buf_map = function(bufnr, mode, target, source, opts)
	opts = opts or {}
	opts.buffer = bufnr

	M.map(mode, target, source, get_map_options(opts))
end

M.command = function(name, fn, opts)
	api.nvim_create_user_command(name, fn, opts or {})
end

M.buf_command = function(bufnr, name, fn, opts)
	api.nvim_buf_create_user_command(bufnr, name, fn, opts or {})
end

M.table = {
	some = function(tbl, cb)
		for k, v in pairs(tbl) do
			if cb(k, v) then
				return true
			end
		end
		return false
	end,
}

M.input = function(keys, mode)
	api.nvim_feedkeys(M.t(keys), mode or "m", true)
end

return M
