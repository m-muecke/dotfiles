-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.cmd('imap <silent><script><expr> <C-J> copilot#Accept("<CR>")')
vim.cmd("let g:copilot_no_tab_map = v:true")
