return {
	-- override plugin definition options
	["neovim/nvim-lspconfig"] = {
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.plugins.lspconfig")
		end,
	},
	-- treesitter
	["nvim-treesitter/nvim-treesitter"] = {
		override_options = {
			ensure_installed = {
        "comment",
				"vim",
				"lua",
				"r",
				"markdown",
				"python",
				"html",
				"css",
				"json",
        "sql",
        "javascript",
        "typescript",
        "tsx",
			},
		},
	},
	["williamboman/mason.nvim"] = {
		override_options = {
			ensure_installed = {
				-- vim
				"vim-language-server",
				-- lua stuff
				"lua-language-server",
				"stylua",
				-- web dev
				"css-lsp",
				"html-lsp",
				"typescript-language-server",
				"json-lsp",
				"prettier",
				-- markdown
				"markdownlint",
				-- python
				"pyright",
				"black",
				"isort",
				-- R
				"r-languageserver",
				-- Docker
				"dockerfile-language-server",
			},
		},
	},
	-- code formatting, linting etc
	["jose-elias-alvarez/null-ls.nvim"] = {
		after = "nvim-lspconfig",
		config = function()
			require("custom.plugins.null-ls")
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
	-- testing
	["nvim-neotest/neotest"] = {
		requires = {
			"nvim-lua/plenary.nvim",
			"shunsambongi/neotest-testthat",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-testthat"),
				},
			})
		end,
	},
	["folke/tokyonight.nvim"] = {},
	["EdenEast/nightfox.nvim"] = {},
  ["nvim-treesitter/playground"] = {},
}
