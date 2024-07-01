vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function getFileTypeComment(before, after)
	local filetype = vim.bo.filetype
	local comment = "//"
	if filetype == "lua" then
		comment = "--"
	end
	if filetype == "elixir" or filetype == "python" or filetype == "bash" or filetype == "sh" then
		comment = "#"
	end
	return before .. comment .. " " .. after
end

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzv")
vim.keymap.set("n", "N", "Nzzv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>rr", ":%s/\\<<C-r><C-w>\\>//g<left><left>")
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("n", "<leader>w", "<C-w>w")

vim.keymap.set("n", "<leader>;", function()
	return getFileTypeComment("_i", "<Esc>")
end, { expr = true })
vim.keymap.set("v", "<leader>;", function()
	return getFileTypeComment("_i", "<Esc>")
end, { expr = true })

vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration)

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<leader>lz", "<cmd>Lazy<CR>")
vim.keymap.set("n", "<leader>ma", "<cmd>Mason<CR>")
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")
