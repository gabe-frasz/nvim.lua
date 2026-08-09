return {
	{
		"theprimeagen/harpoon",
		config = function()
			local mark = require("harpoon.mark")
			local ui = require("harpoon.ui")

			vim.keymap.set("n", "<leader>a", mark.add_file)
			vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

			for i, km in ipairs({ "<C-h>", "<C-j>", "<C-k>", "<C-l>" }) do
				vim.keymap.set("n", km, function()
					ui.nav_file(i)
				end)

				vim.keymap.set("n", "<leader>" .. km, function()
					mark.set_current_at(i)
				end)
			end
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		branch = "master",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			require("telescope").setup({
				defaults = {
					file_ignore_patterns = { "%.git/", "node_modules/" },
				},
				pickers = {
					find_files = {
						hidden = true,
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})

			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>sh", builtin.help_tags)
			vim.keymap.set("n", "<leader>sk", builtin.keymaps)
			vim.keymap.set("n", "<leader>sf", builtin.find_files)
			vim.keymap.set("n", "<leader>ss", builtin.builtin)
			vim.keymap.set("n", "<leader>sw", builtin.grep_string)
			vim.keymap.set("n", "<leader>sg", builtin.live_grep)
			vim.keymap.set("n", "<leader>sd", builtin.diagnostics)
			vim.keymap.set("n", "<leader>sr", builtin.resume)
			vim.keymap.set("n", "<leader>s.", builtin.oldfiles)
			vim.keymap.set("n", "<leader>sb", builtin.buffers)
			vim.keymap.set("n", "<leader>/", function()
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end)
			vim.keymap.set("n", "<leader>sn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end)
		end,
	},
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		keys = {
			{ "<leader>pv", "<cmd>Oil<cr>", desc = "Open Oil explorer" },
		},
		opts = {
			keymaps = {
				["<C-h>"] = false,
				["<C-l>"] = false,
			},
			view_options = {
				show_hidden = true,
			},
		},
		-- Optional dependencies
		dependencies = { { "nvim-mini/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
		keys = {
			{
				"<leader>sj",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			-- { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
			-- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
			-- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
			-- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
		},
	},
}
