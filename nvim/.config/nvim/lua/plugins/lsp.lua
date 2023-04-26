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
      diagnostics = {
        virtual_text = false,
      },
      autoformat = false,
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
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "comment",
        "css",
        "dockerfile",
        "gitignore",
        "html",
        "htmldjango",
        "r",
        "sql",
        "toml",
      })
    end,
  },
}
