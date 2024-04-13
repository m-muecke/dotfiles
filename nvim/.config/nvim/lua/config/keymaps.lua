-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- copilot
-- vim.cmd('imap <silent><script><expr> <C-J> copilot#Accept("<CR>")')
-- -- vim.keymap.set("i", "<C-j>", "copilot#Accep('<CR>')", { expr = true, silent = true })
-- vim.cmd("let g:copilot_no_tab_map = v:true")

-- better line movement
vim.keymap.set({ "n", "v" }, "gh", "0", { desc = "Move to the start of the line" })
vim.keymap.set({ "n", "v" }, "gl", "$", { desc = "Move to the end of the line" })
