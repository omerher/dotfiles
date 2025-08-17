local actions = require("telescope.actions")

return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      mappings = {
        i = {
          ["<C-j>"] = require("telescope.actions").move_selection_next,
          ["<C-k>"] = require("telescope.actions").move_selection_previous,

          ["<esc>"] = actions.close,
        },
      },
    },
  },
}
