return function()
    local null_ls = require("null-ls")
    local builtins = null_ls.builtins

    -- Return formatter args required by `extra_args`
	local function formatter_args(formatter_name)
		local ok, args = pcall(require, "user.configs.formatters." .. formatter_name)
		if not ok then
			args = require("completion.formatters." .. formatter_name)
		end
		return args
	end

    local sources = {
        builtins.formatting.stylua,
    }

	-- require("completion.mason-null-ls").setup()
end
