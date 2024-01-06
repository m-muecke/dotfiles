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
    opts = {
      flavour = "macchiato",
    },
  },
  { "rose-pine/neovim", name = "rose-pine", opts = { variant = "moon" } },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
