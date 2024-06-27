require("bielsz.set")
require("bielsz.remap")
require("bielsz.lazy_init")

local sm = require("supermaven-nvim.api")
if not sm.is_running() then
	sm.start()
end

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

autocmd({ "BufRead", "BufNewFile", "BufNew" }, {
	desc = "Set docker compose filetype",
	group = augroup("docker-compose-filetype", { clear = true }),
	pattern = { "docker-compose.yml", "docker-compose.yaml" },
	command = "set filetype=yaml.docker-compose",
})
