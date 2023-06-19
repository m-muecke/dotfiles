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
        vimls = {},
        texlab = {},
      },
      diagnostics = {
        virtual_text = false,
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
    opts = function(_, opts)
      local nls = require("null-ls")
      vim.list_extend(opts.sources, {
        nls.builtins.diagnostics.dotenv_linter,
        nls.builtins.diagnostics.hadolint,
        nls.builtins.diagnostics.shellcheck,
        nls.builtins.formatting.black,
        nls.builtins.formatting.isort.with({ extra_args = { "--profile=black" } }),
        nls.builtins.formatting.shfmt,
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.xmlformat,
        nls.builtins.formatting.yamlfmt,
        nls.builtins.formatting.sqlfluff.with({ extra_args = { "--dialect=postgres" } }),
        nls.builtins.diagnostics.sqlfluff.with({ extra_args = { "--dialect=postgres" } }),
        nls.builtins.formatting.latexindent,
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
        "shfmt",
        "stylua",
        "yamlfmt",
        "sqlfluff",
      })
    end,
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
        "latex",
      })
    end,
  },
  { "lervag/vimtex" },
}
