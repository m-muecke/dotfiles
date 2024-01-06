-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.autoformat = false

local nmap_leader = function(suffix, rhs, desc, opts)
  opts = opts or {}
  opts.desc = desc
  vim.keymap.set("n", "<Leader>" .. suffix, rhs, opts)
end

local xmap_leader = function(suffix, rhs, desc, opts)
  opts = opts or {}
  opts.desc = desc
  vim.keymap.set("x", "<Leader>" .. suffix, rhs, opts)
end

-- r is for 'R'
nmap_leader("rc", [[<Cmd>T devtools::check()<CR>]], "Check")
nmap_leader("rC", [[<Cmd>T devtools::test_coverage()<CR>]], "Coverage")
nmap_leader("rd", [[<Cmd>T devtools::document()<CR>]], "Document")
nmap_leader("ri", [[<Cmd>T devtools::install(keep_source=TRUE)<CR>]], "Install")
nmap_leader("rk", [[<Cmd>T rmarkdown::render("%")<CR>]], "Knit file")
nmap_leader("rl", [[<Cmd>T devtools::load_all()<CR>]], "Load all")
nmap_leader("rT", [[<Cmd>T testthat::test_file("%")<CR>]], "Test file")
nmap_leader("rt", [[<Cmd>T devtools::test()<CR>]], "Test")
-- Copy to clipboard and make reprex (which itself is loaded to clipboard)
xmap_leader("rx", [["+y :T reprex::reprex()<CR>]], "Reprex selection")

-- s is for 'send' (Send text to neoterm buffer)
nmap_leader("rs", [[<Cmd>TREPLSendLine<CR>j]], "Send to terminal")

-- In simple visual mode send text and move to the last character in
--   selection and move to the right. Otherwise (like in line or block visual
--   mode) send text and move one line down from bottom of selection.
xmap_leader(
  "rs",
  [[mode() ==# "v" ? ":TREPLSendSelection<CR>`>l" : ":TREPLSendSelection<CR>'>j"]],
  "Send to terminal",
  { expr = true }
)
-- t is for 'terminal' (uses 'neoterm') and 'minitest'
nmap_leader("tT", "<Cmd>belowright Tnew<CR>", "Terminal (horizontal)")
nmap_leader("tt", "<Cmd>vertical Tnew<CR>", "Terminal (vertical)")

-- Enable bracketed paste
vim.g.neoterm_bracketed_paste = 1
-- Default python REPL
vim.g.neoterm_repl_python = "ipython"
-- Default R REPL
vim.g.neoterm_repl_r = "radian"
-- Don't add extra call to REPL when sending
vim.g.neoterm_direct_open_repl = 1
-- Open terminal to the right by default
vim.g.neoterm_default_mod = "vertical"
-- Go into insert mode when terminal is opened
vim.g.neoterm_autoinsert = 1
-- Scroll to recent command when it is executed
vim.g.neoterm_autoscroll = 1
-- Change default shell to zsh (if it is installed)
if vim.fn.executable("zsh") == 1 then
  vim.g.neoterm_shell = "zsh"
end
