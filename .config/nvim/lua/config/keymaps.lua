-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local wk = require("which-key")

-- Move text more effeciently
vim.keymap.set("n", "J", "<cmd>m .+1<cr>==", { desc = "Move Down" })
vim.keymap.set("n", "K", "<cmd>m .-2<cr>==", { desc = "Move Up" })
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move Down", silent = true })
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move Up", silent = true })
-- vim.keymap.set("i", "<C-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
-- vim.keymap.set("i", "<C-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })

-- Center on page up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })

-- System clipboard
vim.keymap.set({ "n", "v", "x" }, "<leader>y", [["+y]], { desc = "Clipboard Yank" })
vim.keymap.set({ "n", "v", "x" }, "<leader>p", [["+p]], { desc = "Clipboard Paste" })
wk.add({ "<leader>y", icon = { icon = "󰅇", color = "yellow" } })
wk.add({ "<leader>p", icon = { icon = "󰅇", color = "yellow" } })

vim.keymap.set("n", "X", LazyVim.ui.bufremove, { desc = "Delete Buffer" })
