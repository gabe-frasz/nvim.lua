return {
	{
		"mbbill/undotree",
		keys = {
			{ "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle Undotree" },
		},
	},
	{
		"eandrju/cellular-automaton.nvim",
		keys = {
			{ "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>", desc = "Make it rain" },
		},
	},
	{
		"theprimeagen/vim-be-good",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"stevearc/overseer.nvim",
		---@module 'overseer'
		---@type overseer.SetupOpts
		opts = {
			strategy = "toggleterm",
		},
		keys = {
			{ "<leader>or", "<cmd>OverseerRun<CR>", desc = "Overseer Run" },
			{ "<leader>ot", "<cmd>OverseerToggle<CR>", desc = "Overseer Toggle" },
			{ "<leader>oa", "<cmd>OverseerTaskAction<CR>", desc = "Overseer Task Action" },
		},
	},
}
