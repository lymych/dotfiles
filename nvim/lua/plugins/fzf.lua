return {
  "ibhagwan/fzf-lua",
  keys = {
    -- Find
    { "<leader>fo", "<cmd>FzfLua files<cr>", desc = "Find Files (Root Dir)" },
    { "<leader>/", "<cmd>FzfLua live_grep<cr>", desc = "Grep (Root Dir)" },
  },
  config = function()
    -- calling `setup` is optional for customization
    require("fzf-lua").setup {}
  end,
}
