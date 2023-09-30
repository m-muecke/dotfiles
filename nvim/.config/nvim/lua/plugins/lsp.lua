return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        bashls = {},
        cssls = {},
        html = {},
        vimls = {},
        texlab = {},
      },
      diagnostics = {
        virtual_text = true,
      },
      autoformat = true,
      format = {
        timeout_ms = 100000,
      },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      vim.list_extend(opts.sources, {
        nls.builtins.diagnostics.shellcheck,
        nls.builtins.diagnostics.sqlfluff.with({ extra_args = { "--dialect=postgres" } }),
        nls.builtins.formatting.black,
        nls.builtins.formatting.isort.with({ extra_args = { "--profile=black" } }),
        nls.builtins.formatting.latexindent,
        nls.builtins.formatting.shfmt,
        nls.builtins.formatting.sqlfluff.with({ extra_args = { "--dialect=postgres" } }),
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.xmlformat,
        nls.builtins.formatting.yamlfmt,
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "black",
        "isort",
        "shellcheck",
        "yamlfmt",
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "comment",
          "css",
          "gitignore",
          "htmldjango",
          "latex",
          "sql",
          "xml",
        })
      end
    end,
  },
  { "github/copilot.vim" },
  { "nvim-treesitter/playground" },
}
