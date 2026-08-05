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
}
