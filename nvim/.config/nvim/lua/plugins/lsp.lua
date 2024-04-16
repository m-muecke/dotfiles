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
        sqlls = {},
        typst_lsp = {},
        lua_ls = { settings = { Lua = { hint = { enable = true } } } },
        biome = {},
        tsserver = {
          settings = {
            typescript = {
              inlayHints = {
                includeInlayEnumMemberValueHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayParameterNameHints = "all",
              },
            },
          },
        },
      },
      setup = {
        biome = function()
          LazyVim.lsp.on_attach(function(client, _)
            if client.name == "tsserver" then
              -- Disable format of tsserver
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
        "black",
        "isort",
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
        typescript = { "biome-check" },
        python = { "isort", "black" },
        latex = { "latexindent" },
        xml = { "xmlformat" },
        sql = { "sqlfmt" },
        r = { "my_styler" },
        typ = { "typstfmt" },
      },
      formatters = {
        my_styler = {
          command = "R",
          -- A list of strings, or a function that returns a list of strings
          -- Return a single string instead of a list to run the command in a shell
          args = { "-s", "-e", "styler::style_file(commandArgs(TRUE)[1])", "--args", "$FILENAME" },
          stdin = false,
        },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        sql = { "sqlfluff" },
      },
    },
  },
}
