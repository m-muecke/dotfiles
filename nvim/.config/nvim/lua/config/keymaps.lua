-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- better line movement
vim.keymap.set({ "n", "v" }, "gh", "^", { desc = "Move to the start of the line" })
vim.keymap.set({ "n", "v" }, "gl", "$", { desc = "Move to the end of the line" })
