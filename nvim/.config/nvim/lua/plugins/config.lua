return {
  { "github/copilot.vim" },
  { "EdenEast/nightfox.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nightfox",
    },
  },
  {
    "echasnovski/mini.comment",
    config = function()
      require("mini.comment").setup({
        mappings = {
          comment_line = "<M-/>",
        },
      })
    end,
  },
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
      },
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
          nls.builtins.diagnostics.flake8,
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
      },
    },
  },
  -- add tsserver and setup with typescript.nvim instead of lspconfig
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.json" },
  -- {
  --   "hkupty/iron.nvim",
  --   config = function()
  --     local iron = require("iron.core")
  --     iron.setup({
  --       config = {
  --         scratch_repl = true,
  --         repl_definition = {
  --           sh = {
  --             command = { "zsh" },
  --           },
  --         },
  --       },
  --       keymaps = {
  --         send_motion = "<space>sc",
  --         visual_send = "<space>sc",
  --         send_file = "<space>sf",
  --         send_line = "<space>sl",
  --         send_mark = "<space>sm",
  --         mark_motion = "<space>mc",
  --         mark_visual = "<space>mc",
  --         remove_mark = "<space>md",
  --         cr = "<space>s<cr>",
  --         interrupt = "<space>s<space>",
  --         exit = "<space>sq",
  --         clear = "<space>cl",
  --       },
  --       highlight = {
  --         italic = false,
  --         bold = false,
  --       },
  --       ignore_blank_lines = true,
  --     })
  --   end,
  -- },
  -- { "tpope/vim-dadbod" },
  -- { "kristijanhusak/vim-dadbod-ui" },
}
