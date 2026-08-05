return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			open_mapping = [[<C-/>]],
			direction = "horizontal",
			shade_terminals = true,
		},
		keys = {
			{ "<C-/>", "<cmd>ToggleTerm<CR>", mode = { "n", "i", "t" }, desc = "Toggle Terminal" },
			{ "<C-_>", "<cmd>ToggleTerm<CR>", mode = { "n", "i", "t" }, desc = "Toggle Terminal" },
			{ "<leader>tt", "<cmd>ToggleTerm<CR>", mode = { "n", "t" }, desc = "Toggle Terminal" },
			{ "<Esc><Esc>", "<cmd>ToggleTerm<CR>", mode = "t", desc = "Close Terminal" },
		},
	},
}
