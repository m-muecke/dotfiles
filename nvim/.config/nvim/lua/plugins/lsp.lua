return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        bashls = {},
        cssls = {},
        docker_compose_language_service = {},
        dockerls = {},
        html = {},
        pyright = {},
        r_language_server = {},
        ruff_lsp = {},
        tailwindcss = {},
        vimls = {},
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
          nls.builtins.diagnostics.dotenv_linter,
          nls.builtins.diagnostics.hadolint,
          nls.builtins.diagnostics.shellcheck,
          nls.builtins.formatting.black,
          nls.builtins.formatting.isort.with({ extra_args = { "--profile=black" } }),
          nls.builtins.formatting.shfmt,
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.xmlformat,
          nls.builtins.formatting.yamlfmt,
        },
      }
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "isort",
        "shellcheck",
        "shfmt",
        "stylua",
        "yamlfmt",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "comment",
        "css",
        "dockerfile",
        "gitignore",
        "help",
        "html",
        "htmldjango",
        "javascript",
        "json",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "r",
        "regex",
        "sql",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },
  { "nvim-treesitter/playground" },
}
