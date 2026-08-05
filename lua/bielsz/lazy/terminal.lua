return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { "<leader>tt", "<cmd>ToggleTerm<CR>", desc = "Toggle Terminal" },
      { "<Esc><Esc>", "<cmd>ToggleTerm<CR>", mode = "t", desc = "Exit terminal mode" },
      -- { "<Esc><Esc>", "<C-\\><C-n>", mode = "t", desc = "Exit terminal mode" },
    },
    opts = {},
  },
}
