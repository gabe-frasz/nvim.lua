vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzv")
vim.keymap.set("n", "N", "Nzzv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>rr", ":%s/\\<<C-r><C-w>\\>//g<left><left>")
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("n", "<leader>w", "<C-w>w")
vim.keymap.set("n", "<leader>lz", "<cmd>Lazy<CR>")

vim.keymap.set("n", "<leader>;", "gcc", { remap = true, desc = "Toggle line comment" })
vim.keymap.set("v", "<leader>;", "gc", { remap = true, desc = "Toggle comment selection" })
