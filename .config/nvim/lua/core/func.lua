local M = {}

-- Keymap function
function M.set(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	options = vim.tbl_deep_extend("force", options, opts or {})
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

return M
