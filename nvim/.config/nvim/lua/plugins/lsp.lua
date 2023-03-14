return {
  -- { "github/copilot.vim" },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
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
        timeout_ms = 2000,
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
          nls.builtins.formatting.black,
          nls.builtins.formatting.isort,
          nls.builtins.formatting.yamlfmt,
          nls.builtins.formatting.xmlformat,
          nls.builtins.diagnostics.flake8,
          nls.builtins.diagnostics.shellcheck,
          nls.builtins.diagnostics.yamllint,
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
        "flake8",
        "black",
        "isort",
        "yamlfmt",
        "yamllint",
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
}
