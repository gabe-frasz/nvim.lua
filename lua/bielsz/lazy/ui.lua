function ColorMyPencils(color)
	color = color or "zenwritten"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
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
    init = function()
      ColorMyPencils()
    end,
	},
}
