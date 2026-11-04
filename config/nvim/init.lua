-- --------------------------------------------
-- Bootstrap Lazy.nvim
-- --------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- --------------------------------------------
-- Setup LazyVim
-- --------------------------------------------
require("lazy").setup({
	spec = {
		{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
		{ "bluz71/vim-moonfly-colors" },
		{ "ember-theme/nvim" },
		{ "julien/vim-colors-green" },
		{ "LazyVim/LazyVim", opts = { colorscheme = "moonfly" } },

		-- OPTIONAL: extras
		-- { import = "lazyvim.plugins.extras.lang.typescript" },
		-- { import = "lazyvim.plugins.extras.lang.json" },
		-- { import = "lazyvim.plugins.extras.coding.mini-surround" },
		-- { import = "lazyvim.plugins.extras.ui.treesitter-context" },

		{
			"neovim/nvim-lspconfig",
			dependencies = { "barreiroleo/ltex_extra.nvim" },
			opts = {
				servers = {
					ltex_plus = {
						filetypes = { "markdown", "plaintext", "text", "gitcommit" },
						settings = {
							ltex = {
								language = "en-US", -- or "pt-BR"
								additionalRules = { enablePickyRules = true },
								dictionary = {
									["en-US"] = { "LazyVim", "Neovim", "nixpkgs", "flake" },
									["pt-BR"] = { "Neovim", "nixpkgs" },
								},
							},
						},
						on_attach = function()
							require("ltex_extra").setup({
								load_langs = { "en-US", "pt-BR" },
								path = vim.fn.stdpath("config") .. "/spell",
							})
						end,
					},
				},
			},
		},
	},
	defaults = {
		lazy = false,
		version = false,
	},
	install = { colorscheme = { "moonfly" } },
	checker = { enabled = true },
	change_detection = { notify = false },
})

-- --------------------------------------------
-- Personal settings
-- --------------------------------------------
vim.opt.tabstop = 3
vim.opt.shiftwidth = 3
vim.opt.expandtab = false
vim.opt.smartindent = true
