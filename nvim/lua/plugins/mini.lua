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
      { "<cr>", "<cmd>lua MiniJump2d.start(MiniJump2d.builtin_opts.single_character)<CR>", desc = "Start 2d jumping" },
    },
    config = function()
      require("mini.bufremove").setup()

      require("mini.pairs").setup()

      require("mini.surround").setup {
        highlight_duration = 500,
        n_lines = 20,
        mappings = {
          add = "sa",
          delete = "sd",
          find = "sf",
          find_left = "sF",
          highlight = "sh",
          replace = "sr",
          update_n_lines = "sn",
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
            "Neogit*",
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
      vim.api.nvim_set_hl(0, "MiniFilesNormal", { link = "Normal" })
      vim.api.nvim_set_hl(0, "MiniFilesBorder", { link = "Normal" })
      vim.api.nvim_set_hl(0, "MiniFilesTitleFocused", { link = "Normal" })

      require("mini.animate").setup {
        vim.api.nvim_create_autocmd("FileType", {
          pattern = {
            "Neogit*",
          },
          callback = function()
            vim.b.minianimate_disable = true
          end,
        }),
      }

      -- Fix paste https://github.com/echasnovski/mini.nvim/issues/709
      -- vim.paste = function(_, phase)
      --   if phase == -1 or phase == 3 then
      --     vim.fn.feedkeys('"+p', "nx")
      --   end
      -- end

      require("mini.jump2d").setup {
        labels = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
        allowed_lines = {
          blank = false,
          cursor_before = true,
          cursor_at = true,
          cursor_after = true,
          fold = false,
        },
        view = {
          dim = true,
          n_steps_ahead = 0,
        },
        mappings = {
          start_jumping = "",
        },
      }

      require("mini.diff").setup {
        mappings = {
          apply = "<leader>gh",
          reset = "<leader>gr",
        },
        view = {
          style = "sign",
          signs = {
            add = "▎",
            change = "▎",
            delete = "",
          },
        },
      }

      require("mini.icons").setup()
      MiniIcons.mock_nvim_web_devicons()
      -- more
    end,
  },
}
