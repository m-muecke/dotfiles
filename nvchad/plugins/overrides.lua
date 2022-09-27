local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "r",
    "markdown",
    "python",
    "html",
    "css",
  },
}

M.mason = {
  ensure_installed = {
    -- vim
    "vim-language-server",
    -- lua stuff
    "lua-language-server",
    "stylua",
    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "prettier",
    -- python
    "pyright",
    "black",
    "isort",
    -- R
    "r-languageserver",
    -- markdown
    "markdownlint",
    -- tex
    "texlab",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
