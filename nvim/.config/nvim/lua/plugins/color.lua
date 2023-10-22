return {
  {
    "EdenEast/nightfox.nvim",
    event = "VeryLazy",
    config = function()
      require("nightfox").setup({
        options = {},
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
    opts = { transparent = false, style = "storm" },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    opts = {
      flavour = "macchiato",
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
