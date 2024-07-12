return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- calling `setup` is optional for customization
    require("fzf-lua").setup {}
  end,
  keys = {
    -- Find
    { "<leader>fo", "<cmd>FzfLua files<cr>", desc = "Find Files (Root Dir)" },
    { "<leader>/", "<cmd>FzfLua live_grep<cr>", desc = "Grep (Root Dir)" },
  },
}
