-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local del = vim.keymap.del
local wk = require("which-key")

-- Move text more effeciently
map("n", "J", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("n", "K", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move Down", silent = true })
map("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move Up", silent = true })

-- Center on page up/down
map("n", "<C-d>", "<C-d>zz", { noremap = true })
map("n", "<C-u>", "<C-u>zz", { noremap = true })

-- System clipboard
map({ "n", "v", "x" }, "<leader>y", [["+y]], { desc = "Clipboard Yank" })
map({ "n", "v", "x" }, "<leader>p", [["+p]], { desc = "Clipboard Paste" })
wk.add({ "<leader>y", icon = { icon = "󰅇", color = "yellow" } })
wk.add({ "<leader>p", icon = { icon = "󰅇", color = "yellow" } })

-- Close buffer on Shift-X
map("n", "X", LazyVim.ui.bufremove, { desc = "Delete Buffer" })

-- Terminal settings
local lazyterm = function()
  LazyVim.terminal(nil, { cwd = LazyVim.root() })
end

map("n", "<C-t>", lazyterm, { desc = "Floating Terminal" })
map("t", "<C-t>", "<cmd>close<cr>", { desc = "Hide Terminal" })

-- Remove current toggle terminal bindings
del("n", "<C-/>")
del("n", "<C-_>")
del("t", "<C-/>")
del("t", "<C-_>")

-- Allow CTRL+hjkl in fzf in terminal
del("t", "<C-h>")
del("t", "<C-j>")
del("t", "<C-k>")
del("t", "<C-l>")

-- Copied from neovim/runtime/lua/vim/_defaults.lua
do
  local operator_rhs = function()
    return require("vim._comment").operator()
  end
  map({ "n", "x" }, "<C-_>", operator_rhs, { expr = true, desc = "Toggle Comment" })
  map({ "n", "x" }, "<C-/>", operator_rhs, { expr = true, desc = "Toggle Comment" })

  local line_rhs = function()
    return require("vim._comment").operator() .. "_"
  end
  map("n", "<C-_>", line_rhs, { expr = true, desc = "Toggle Comment Line" })
  map("n", "<C-/>", line_rhs, { expr = true, desc = "Toggle Comment Line" })

  local textobject_rhs = function()
    require("vim._comment").textobject()
  end
  map({ "o" }, "<C-_>", textobject_rhs, { desc = "Comment Textobject" })
  map({ "o" }, "<C-/>", textobject_rhs, { desc = "Comment Textobject" })
end
