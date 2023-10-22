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
      format = {
        timeout_ms = 100000,
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "black",
        "isort",
        "latexindent",
        "shellcheck",
        "sqlfluff",
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
        })
      end
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["python"] = { "isort", "black" },
        ["latex"] = { "latexindent" },
        ["xml"] = { "xmlformat" },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {},
    },
  },
  { "github/copilot.vim" },
}
