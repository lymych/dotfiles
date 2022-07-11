return {
  "akinsho/bufferline.nvim",
  version = "*",
  event = "VeryLazy",
  opts = {
    highlights = {
      fill = {
        bg = "none",
      },
    },
    options = {
      separator_style = "thick",
      always_show_bufferline = false,
      offsets = {
        {
          filetype = "neo-tree",
          text = "File Explorer",
          highlight = "Directory",
          separator = true,
        },
      },
      close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
      right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
      left_mouse_command = "buffer %d", -- can be a string | function, | false see "Mouse actions"
      move_wraps_at_ends = true,
      indicator = {
        style = "icon",
        icon = "",
      },
    },
  },
}
