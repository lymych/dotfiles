return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>e", "<cmd>Neotree toggle reveal_force_cwd<cr>", desc = "Find Files" },
    },
    opts = {
      close_if_last_window = true,
      --enable_git_status = true,
      -- sources = { "filesystem" },
      source_selector = {
        -- winbar = true,
        content_layout = "center",
        sources = {
          { source = "filesystem", "File" },
        },
        window = {
          auto_expand_width = true,
        },
        filesystem = {
          follow_current_file = {
            enabled = true, -- This will find and focus the file in the active buffer every time
          },
          hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
        },
      },
      open_files_do_not_replace_types = { "terminal", "Trouble", "qf", "Outline" },
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
        filtered_items = {
          visible = false,
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_by_name = {
            '.git',
            '.DS_Store',
          },
        }
      },
      window = {
        mappings = {
          ["<space>"] = "none",
        },
      },
      default_component_configs = {
        indent = {
          with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
      },
    },
  }
}
