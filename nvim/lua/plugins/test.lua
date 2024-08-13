return {
  {
    "fei6409/log-highlight.nvim",
    config = function()
      require("log-highlight").setup {}
    end,
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
      "nvim-telescope/telescope.nvim", -- optional
    },
    opts = {
      integrations = {
        diffview = true,
      },
    },
    config = true,
    keys = {
      { "<Leader>gg", "<cmd>Neogit<CR>", desc = "Toggle Neogit" },
    },
  },
}
