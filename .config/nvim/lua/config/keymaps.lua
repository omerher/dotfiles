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

del("n", "<C-/>")
del("n", "<C-_>")
map("n", "<C-t>", lazyterm, { desc = "Floating Terminal" })

del("t", "<C-h>")
del("t", "<C-j>")
del("t", "<C-k>")
del("t", "<C-l>")
map("t", "<C-t>", "<cmd>close<cr>", { desc = "Hide Terminal" })
