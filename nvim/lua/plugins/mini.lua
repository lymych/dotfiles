return {
  {
    "echasnovski/mini.nvim",
    event = "VeryLazy",
    version = false,
    -- stylua: ignore
    keys = {
      { "<leader>x", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
      { "<leader>X", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
      { "<leader>e", function() require("mini.files").open(vim.api.nvim_buf_get_name(0), true) end, desc = "Open mini.files (Directory of Current File)", },
      { "<leader>E", function() require("mini.files").open(vim.uv.cwd(), true) end, desc = "Open mini.files (cwd)", },
      { "<leader>go", function() require("mini.diff").toggle_overlay(0) end, desc = "Toggle mini.diff overlay", },
    },
    config = function()
      require("mini.bufremove").setup()

      require("mini.pairs").setup()

      require("mini.surround").setup {
        highlight_duration = 500,
        n_lines = 20,
        mappings = {
          add = "sa", -- Add surrounding in Normal and Visual modes
          delete = "sd", -- Delete surrounding
          find = "sf", -- Find surrounding (to the right)
          find_left = "sF", -- Find surrounding (to the left)
          highlight = "sh", -- Highlight surrounding
          replace = "sr", -- Replace surrounding
          update_n_lines = "sn", -- Update `n_lines`
        },
        silent = false,
      }

      require("mini.indentscope").setup {
        symbol = "│",
        options = { try_as_border = true },
        vim.api.nvim_create_autocmd("FileType", {
          pattern = {
            "alpha",
            "dashboard",
            "fzf",
            "help",
            "lazy",
            "lazyterm",
            "mason",
            "neo-tree",
            "Trouble",
            "trouble",
          },
          callback = function()
            vim.b.miniindentscope_disable = true
          end,
        }),
      }

      require("mini.comment").setup {
        options = {
          custom_commentstring = function()
            return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
          end,
        },
      }

      require("mini.ai").setup()

      require("mini.files").setup()

      require("mini.animate").setup()

      require("mini.jump2d").setup()

      require("mini.diff").setup {
        view = {
          style = "sign",
          signs = {
            add = "▎",
            change = "▎",
            delete = "",
          },
        },
      }
    end,
  },
}
