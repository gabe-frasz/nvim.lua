return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		{ "j-hui/fidget.nvim", opts = {} },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func)
					vim.keymap.set("n", keys, func, { buffer = event.buf })
				end

				local tl_builtin = require("telescope.builtin")
				--  To jump back, press <C-t>.
				map("<leader>gd", tl_builtin.lsp_definitions)
				map("<leader>gr", tl_builtin.lsp_references)
				map("<leader>gI", tl_builtin.lsp_implementations)
				map("<leader>D", tl_builtin.lsp_type_definitions)
				map("<leader>ds", tl_builtin.lsp_document_symbols)
				map("<leader>ws", tl_builtin.lsp_dynamic_workspace_symbols)
				map("K", vim.lsp.buf.hover)
				map("<leader>ca", vim.lsp.buf.code_action)
				map("<leader>gD", vim.lsp.buf.declaration)

				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.server_capabilities.documentHighlightProvider then
					local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references,
					})

					vim.api.nvim_create_autocmd("LspDetach", {
						group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
						callback = function(event2)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
						end,
					})
				end
			end,
		})

		local capabilities = vim.tbl_deep_extend(
			"force",
			vim.lsp.protocol.make_client_capabilities(),
			require("cmp_nvim_lsp").default_capabilities()
		)

		vim.lsp.config("*", {
			capabilities = capabilities,
		})

		require("fidget").setup({})
		require("mason").setup()
		require("mason-tool-installer").setup({
			ensure_installed = {
				"lua-language-server",
				"stylua",
				"gopls",
				"rust-analyzer",
				"prettier",
				"biome",
				"tsgo",
			},
			integrations = {
				["mason-lspconfig"] = false,
			},
		})
		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					vim.lsp.enable(server_name)
				end,
			},
			ensure_installed = {
				"lua_ls",
				"gopls",
				"rust_analyzer",
				"biome",
			},
			automatic_installation = false,
		})

		local cmp = require("cmp")
		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-k>"] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
				-- { name = "supermaven" },
				{ name = "nvim_lsp" },
			}, {
				{ name = "buffer" },
			}),
		})

		vim.diagnostic.config({
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = true,
				header = "",
				prefix = "",
			},
		})

		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
		vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
		vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
		vim.keymap.set("n", "<leader>ma", "<cmd>Mason<CR>")

		-- Set up tsgo manually since it's not natively supported by mason-lspconfig yet
		vim.lsp.config("tsgo", {
			cmd = { "tsgo", "--lsp", "--stdio" },
			filetypes = {
				"javascript",
				"javascriptreact",
				"javascript.jsx",
				"typescript",
				"typescriptreact",
				"typescript.tsx",
			},
			root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
		})
		vim.lsp.enable("tsgo")
	end,
}
