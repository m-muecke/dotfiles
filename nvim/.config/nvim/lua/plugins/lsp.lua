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
        texlab = {},
        sqlls = {},
        typst_lsp = {},
        biome = {},
      },
      setup = {
        biome = function()
          LazyVim.lsp.on_attach(function(client, _)
            if client.name == "vtsls" then
              -- Disable format of vtsls
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
      format = {
        timeout_ms = 100000,
      },
      inlay_hints = {
        enabled = false,
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "latexindent",
        "shellcheck",
        "sqlfluff",
        "sqlfmt",
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
          "sql",
          "xml",
          "typst",
        })
      end
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        python = { "ruff_format" },
        typescript = { "biome-check" },
        latex = { "latexindent" },
        xml = { "xmlformat" },
        sql = { "sqlfmt" },
        sh = { "shfmt" },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        sql = { "sqlfluff" },
        sh = { "shellcheck" },
      },
    },
  },
}
