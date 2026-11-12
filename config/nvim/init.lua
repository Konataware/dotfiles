vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

require("lazy").setup({
	spec = {
		{
			"LazyVim/LazyVim",
			import = "lazyvim.plugins",
			opts = { colorscheme = "moonfly" },
		},

		{ "bluz71/vim-moonfly-colors" },
		{ "ember-theme/nvim" },
		{ "julien/vim-colors-green" },

		{ import = "lazyvim.plugins.extras.lang.typescript" },
		{ import = "lazyvim.plugins.extras.lang.json" },
		{ import = "lazyvim.plugins.extras.formatting.prettier" },
		{ import = "lazyvim.plugins.extras.linting.eslint" },

		-- { import = "lazyvim.plugins.extras.coding.mini-surround" },
		-- { import = "lazyvim.plugins.extras.ui.treesitter-context" },
		--[[
		{
			"neovim/nvim-lspconfig",
			dependencies = { "barreiroleo/ltex_extra.nvim" },
			opts = {
				servers = {
					ltex_plus = {
						filetypes = { "markdown", "plaintext", "text", "gitcommit" },
						settings = {
							ltex = {
								language = "pt-BR",
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
		},]]
	},
	defaults = {
		version = false,
	},
	install = { colorscheme = { "moonfly" } },
	checker = { enabled = true },
	change_detection = { notify = false },
})
