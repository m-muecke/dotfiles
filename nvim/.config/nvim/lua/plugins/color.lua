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
    opts = { transparent = true, style = "storm" },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
