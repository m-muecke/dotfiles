return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        pyright = {},
        r_language_server = {},
        vimls = {},
        bashls = {},
        dockerls = {},
        docker_compose_language_service = {},
        cssls = {},
      },
      autoformat = true,
      format = {
        timeout_ms = 10000,
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      local nls = require("null-ls")
      return {
        sources = {
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.shfmt,
          nls.builtins.formatting.yamlfmt,
          nls.builtins.formatting.xmlformat,
          -- nls.builtins.diagnostics.flake8,
          nls.builtins.diagnostics.shellcheck,
          nls.builtins.diagnostics.yamllint,
          nls.builtins.formatting.black,
          nls.builtins.formatting.isort,
          nls.builtins.diagnostics.ruff,
          nls.builtins.formatting.ruff,
        },
      }
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "yamlfmt",
        "yamllint",
        "tailwindcss-language-server",
        "black",
        "isort",
        -- "flake8",
        "ruff",
        -- "ruff-lsp",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "help",
        "html",
        "htmldjango",
        "css",
        "javascript",
        "json",
        "lua",
        "markdown",
        "python",
        "markdown_inline",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "r",
        "comment",
        "gitignore",
        "sql",
        "dockerfile",
        "toml",
      },
    },
  },
  { "nvim-treesitter/playground" },
  -- {
  --   "danymat/neogen",
  --   dependencies = "nvim-treesitter/nvim-treesitter",
  --   -- config = function(),
  --   -- opts = {
  --   --   snippet_engine = "luasnip",
  --   -- },
  -- },
}
