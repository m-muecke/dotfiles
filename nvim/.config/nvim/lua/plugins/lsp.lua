return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        html = {},
        cssls = {},
        tailwindcss = {},
        pyright = {},
        ruff_lsp = {},
        r_language_server = {},
        vimls = {},
        bashls = {},
        dockerls = {},
        docker_compose_language_service = {},
      },
      autoformat = true,
      format = {
        timeout_ms = 10000,
      },
      setup = {
        ruff_lsp = function()
          require("lazyvim.util").on_attach(function(client, _)
            if client.name == "ruff_lsp" then
              client.server_capabilities.hoverProvider = false
            end
          end)
        end,
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
          nls.builtins.diagnostics.shellcheck,
          nls.builtins.formatting.black,
          nls.builtins.formatting.isort.with({ extra_args = { "--profile=black" } }),
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
        "black",
        "isort",
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
}
