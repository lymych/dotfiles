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
      { "<Leader>gc", "<cmd>Neogit commit<CR>", desc = "Neogit Commit" },
      { "<Leader>gp", "<cmd>Neogit pull<CR>", desc = "Neogit Pull" },
      { "<Leader>gP", "<cmd>Neogit push<CR>", desc = "Neogit Push" },
      { "<Leader>gb", "<cmd>Telescope git_branches<CR>", desc = "Telescope git branches" },
    },
  },
  {
    "FabijanZulj/blame.nvim",
    opts = {
      blame_options = { "-w" },
    },
  },
  {
    "linrongbin16/gitlinker.nvim",
    config = function()
      require("gitlinker").setup {
        cmd = "GitLink",
        router = {
          browse = {
            ["^code.rbi.tech"] = require("gitlinker.routers").github_browse,
          },
          blame = {
            ["^code.rbi.tech"] = require("gitlinker.routers").github_blame,
          },
        },
      }
    end,
    keys = {
      { "<leader>gy", "<cmd>GitLink<cr>", mode = { "n", "v" }, desc = "Yank git link" },
      { "<leader>go", "<cmd>GitLink!<cr>", mode = { "n", "v" }, desc = "Open git link" },
    },
  },
}
