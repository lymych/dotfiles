return {
  "ibhagwan/fzf-lua",
  -- stylua: ignore
  keys = {
    { "<space>F", "<cmd>FzfLua<cr>", desc = "open FzfLua" },
    { "<leader>ff", function() require("fzf-lua").files { formatter = "path.filename_first" } end, desc = "Find File", },
    { "<leader>fg", function() require("fzf-lua").live_grep_native() end, desc = "Search Project", },
    { "<leader>sd", function() require("fzf-lua").grep_cword { formatter = "path.filename_first" } end, desc = "Grep Current Word", },
    { "<leader>lf", function() require("fzf-lua").lsp_finder { regex_filter = "func" } end, desc = "Lsp Finder with function filter", },
    { "<leader>o", function() require("fzf-lua").oldfiles { formatter = "path.filename_first" } end, desc = "Old files opened", },
    { "<leader>b", function() require("fzf-lua").buffers { formatter = "path.filename_first" } end, desc = "Find Buffers", },
    { "<leader>gc", function() require("fzf-lua").git_commits() end, desc = "Git Commits", },
    { "<leader>gp", function() require("fzf-lua").git_bcommits() end, desc = "Git commit log (buffer)", },
    { "<leader>gb", function() require("fzf-lua").git_branches() end, desc = "Git Branches", },
    { "<leader>gS", function() require("fzf-lua").git_stash() end, desc = "Git Stashes", },
    { "<leader>gs", function() require("fzf-lua").git_status() end, desc = "Git Status", },
    { "<leader>lr", function() require("fzf-lua").lsp_references() end, desc = "List symbol References", },
    { "<leader>li", function() require("fzf-lua").lsp_implementations() end, desc = "List Implementations", },
    { "<leader>m", function() require("fzf-lua").marks() end, desc = "List Marks", },
  },
  config = function()
    -- calling `setup` is optional for customization
    require("fzf-lua").setup {}
  end,
}
