return {
  {
    "Bekaboo/dropbar.nvim",
    enabled = function()
      return vim.fn.has("nvim-0.10") == 1
    end,
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
    },
  },
}
