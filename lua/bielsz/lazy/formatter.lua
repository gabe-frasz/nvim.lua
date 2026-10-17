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
				elixir = { "mix" },
				go = { "goimports", "gofmt" },
				javascript = { "oxfmt" },
				typescript = { "oxfmt" },
				json = { "oxfmt" },
				html = { "oxfmt" },
				css = { "oxfmt" },
				yaml = { "oxfmt" },
				markdown = { "oxfmt" },
				bash = { "beautysh" },
				sh = { "beautysh" },
        clojure = {"cljfmt"},
			},
		},
	},
}
