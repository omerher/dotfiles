return {
  "polarmutex/git-worktree.nvim",
  version = "^2",
  dependencies = { "nvim-lua/plenary.nvim" },
  enabled = true,
  config = function()
    require("telescope").load_extension("git_worktree")
  end,
}
