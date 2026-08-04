function ColorMyPencils(color)
	color = color or "nordbones"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
	{
		"ficcdaf/ashen.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		init = function()
			ColorMyPencils("ashen")
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				disable_background = true,
				styles = {
					italic = false,
				},
			})
		end,
	},
	{
		"zenbones-theme/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.nordbones = {
				lighten_noncurrent_window = true,
				italic_comments = false,
			}
		end,
	},
}
