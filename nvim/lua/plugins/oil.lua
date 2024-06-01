return {
  'stevearc/oil.nvim',
  opts = {},
  config = function()
    require("oil").setup({
      default_file_explorer = true,
      columns = {
        "icon",
      },
    })
  end,
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
