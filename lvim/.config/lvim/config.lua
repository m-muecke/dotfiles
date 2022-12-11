-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true
vim.opt.spell = false
vim.opt.spelllang = "en_us"

-- general
lvim.log.level = "info"
lvim.format_on_save = {
	enabled = true,
	-- pattern = "*.R|*.lua",
	timeout = 1000,
}
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- -- Change theme settings
lvim.colorscheme = "lunar"

-- After changing plugin config exit and reopen LunarVim, Run :PackerSync
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

-- lvim.builtin.treesitter.ignore_install = { "haskell" }

-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>

-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "stylua" },
	{ command = "black", filetypes = { "python" } },
	{ command = "isort", filetypes = { "python" } },
	{ command = "prettier", filetypes = { "typescript", "typescriptreact" } },
})
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{ command = "flake8", filetypes = { "python" } },
	{
		command = "shellcheck",
		args = { "--severity", "warning" },
	},
})

-- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
	{
		"zbirenbaum/copilot.lua",
		event = { "VimEnter" },
		config = function()
			vim.defer_fn(function()
				require("copilot").setup({
					plugin_manager_path = get_runtime_dir() .. "/site/pack/packer",
				})
			end, 100)
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup()
		end,
		after = { "copilot.lua", "nvim-cmp" },
	},
	"EdenEast/nightfox.nvim",
	{
		-- support for surround motions
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		config = function()
			require("lsp_signature").on_attach()
		end,
		event = "BufRead",
	},
	{
		"nvim-neotest/neotest",
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
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	"lervag/vimtex",
	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
	},
	{
		"hkupty/iron.nvim",
		config = function()
			require("iron.core").setup({
				config = {
					-- Whether a repl should be discarded or not
					scratch_repl = true,
					-- Your repl definitions come here
					repl_definition = {
						sh = {
							-- Can be a table or a function that
							-- returns a table (see below)
							command = { "zsh" },
						},
					},
					-- How the repl window will be displayed
					-- See below for more information
					repl_open_cmd = require("iron.view").right(40),
				},
				-- Iron doesn't set keymaps by default anymore.
				-- You can set them here or manually add keymaps to the functions in iron.core
				keymaps = {
					send_motion = "<space>sc",
					visual_send = "<space>sc",
					send_file = "<space>sf",
					send_line = "<space>sl",
					send_mark = "<space>sm",
					mark_motion = "<space>mc",
					mark_visual = "<space>mc",
					remove_mark = "<space>md",
					cr = "<space>s<cr>",
					interrupt = "<space>s<space>",
					exit = "<space>sq",
					clear = "<space>cl",
				},
				-- If the highlight is on, you can change how it looks
				-- For the available options, check nvim_set_hl
				highlight = {
					italic = true,
				},
				ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
			})
		end,
	},
}

lvim.builtin.cmp.formatting.source_names["copilot"] = "(Copilot)"
table.insert(lvim.builtin.cmp.sources, 1, { name = "copilot" })

local iron = require("iron.core")

local function iron_send(str)
	iron.send("r", { str })
end

local function r_send(str)
	return function(opts)
		iron_send(str)
	end
end

vim.api.nvim_create_user_command("RLoadPackage", r_send("devtools::load_all()"), { nargs = 0 })
vim.api.nvim_create_user_command("RCheckPackage", r_send("devtools::check()"), { nargs = 0 })
vim.api.nvim_create_user_command("RTestPackage", r_send("devtools::test()"), { nargs = 0 })
vim.api.nvim_create_user_command("RDocumentPackage", r_send("devtools::document()"), { nargs = 0 })
vim.api.nvim_create_user_command("RMake", r_send("devtools::document(); devtools::install()"), { nargs = 0 })
vim.api.nvim_create_user_command("RHelp", function(opts)
	iron_send('help("' .. opts.args .. '")')
end, { nargs = 1 })

local map = vim.keymap.set

map("n", "<cr>", function()
	local pos = vim.api.nvim_win_get_cursor(0)
	local linenr = pos[1] - 1
	local buf_line = vim.trim(vim.api.nvim_buf_get_lines(0, linenr, linenr + 1, 0)[1])

	-- check if we are in a roxygen example region
	-- if yes, remove the "#'" prefix
	-- this should be done using treesitter :/
	if vim.startswith(buf_line, "#'") then
		for i = linenr, 0, -1 do
			local cur_line = vim.trim(vim.api.nvim_buf_get_lines(0, i, i + 1, 0)[1])
			if not vim.startswith(cur_line, "#'") then
				break
			end
			if vim.startswith(cur_line, "#' @examples") then
				buf_line = string.gsub(buf_line, "^#'%s*", "")
				break
			end
		end
	end

	iron_send(buf_line)

	if pos[1] < vim.fn.line("$") then
		vim.api.nvim_win_set_cursor(0, { pos[1] + 1, pos[2] })
	end
end)

map("n", "<leader>rh", function()
	iron.send("r", { 'help("' .. vim.fn.expand("<cword>") .. '")' })
end, { noremap = true })

map("n", "<leader>rp", function()
	iron.send("r", { "print(" .. vim.fn.expand("<cword>") .. ")" })
end, { noremap = true })

map("n", "<leader>rt", function()
	iron.send("r", { "str(" .. vim.fn.expand("<cword>") .. ")" })
end, { noremap = true })

vim.cmd("autocmd TermOpen * setlocal nonumber norelativenumber")
