return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        r = { "air" },
        quarto = { "injected" },
        rmd = { "injected" },
      },
    },
  },
  { "MeanderingProgrammer/render-markdown.nvim", enabled = false },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        air = {},
      },
      setup = {
        air = function()
          LazyVim.lsp.on_attach(function(client, _)
            if client.name == "r_language_server" then
              -- Disable format of r_language_server
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
    },
  },
}
