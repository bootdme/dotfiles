-- https://github.com/CharlesChiuGit/nvimdots.lua/blob/main/lua/core/global.lua
local global = {}

function global:load_variables()	
	local home = os.getenv("HOME")
	local path_sep = "/"

	self.vim_path = vim.fn.stdpath("config")
	
	self.cache_dir = home .. path_sep .. ".cache" .. path_sep .. "nvim" .. path_sep
	self.modules_dir = self.vim_path .. path_sep .. "modules"
	self.home = home
	self.data_dir = string.format("%s/site/", vim.fn.stdpath("data"))
end

global:load_variables()

return global
