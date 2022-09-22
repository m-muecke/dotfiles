local overrides = require "custom.plugins.overrides"

return {
  -- override plugin definition options
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  ["williamboman/mason.nvim"] = {
    override_options = {
      ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",
        -- python
        "pyright",
        "black",
        "isort",
        -- R
        "r-languageserver",
      },
    },
  },
  -- code formatting, linting etc
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },
  -- support for surround motions
  ["kylechui/nvim-surround"] = {
    config = function()
      require("nvim-surround").setup()
    end,
  },
  -- enable which-key
  ["folke/which-key.nvim"] = {
    disable = false,
  },
  -- highlight word under cursor
  ["RRethy/vim-illuminate"] = {},
}
