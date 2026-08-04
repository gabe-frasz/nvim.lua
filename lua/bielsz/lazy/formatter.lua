return {
	{
		"stevearc/conform.nvim",
		lazy = false,
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
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
