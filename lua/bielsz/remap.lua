vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })
vim.keymap.set("n", "n", "nzzv", { desc = "Jump to next match" })
vim.keymap.set("n", "N", "Nzzv", { desc = "Jump to previous match" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
vim.keymap.set("n", "<leader>rr", ":%s/\\<<C-r><C-w>\\>//g<left><left>", { desc = "Replace word" })
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("n", "<leader>w", "<C-w>w")
vim.keymap.set("n", "<leader>lz", "<cmd>Lazy<CR>")

vim.keymap.set("n", "<leader>;", "gcc", { remap = true, desc = "Toggle line comment" })
vim.keymap.set("v", "<leader>;", "gc", { remap = true, desc = "Toggle comment selection" })

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete motion/selection without yanking" })
