return {
	{
		"stevearc/conform.nvim",
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
			{
				"<leader>Fd",
				function()
					vim.b.disable_autoformat = true
				end,
				desc = "Disable autoformat for buffer",
			},
			{
				"<leader>Fe",
				function()
					vim.b.disable_autoformat = false
				end,
				desc = "Enable autoformat for buffer",
			},
		},
		opts = {
			notify_on_error = false,
			formatters_by_ft = {
				cpp = { "clang_format" },
				lua = { "stylua" },
				javascript = { "biome" },
				typescript = { "biome", "prettier" },
				json = { "biome" },
				elixir = { "mix" },
				go = { "goimports", "gofmt" },
				html = { "prettier" },
				css = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				bash = { "beautysh" },
				sh = { "beautysh" },
			},
		},
	},
}
