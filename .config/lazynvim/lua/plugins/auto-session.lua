return {
  "rmagatti/auto-session",
  lazy = false,
  dependencies = {
    "nvim-telescope/telescope.nvim", -- Only needed if you want to use session lens
  },
  keys = {
    -- Will use Telescope if installed or a vim.ui.select picker otherwise
    { "<leader>qs", "<cmd>SessionSearch<CR>", desc = "Session Search" },
    { "<leader>qS", "<cmd>SessionSave<CR>", desc = "Save Session" },
  },
  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { "~/", "/" },
    -- log_level = 'debug',
  },
}
