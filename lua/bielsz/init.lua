require("bielsz.set")
require("bielsz.remap")
require("bielsz.lazy_init")

require("supermaven-nvim.api").start()

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
