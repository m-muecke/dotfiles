local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } },
  -- Lua
  b.formatting.stylua,
  -- R
  b.formatting.styler,
  -- python
  b.formatting.black,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
