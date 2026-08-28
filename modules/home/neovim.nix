{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    initLua = ''
      			-- --------------------------------------------
      			-- Bootstrap Lazy.nvim (the plugin manager)
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
      					-- This imports the entire LazyVim distribution
      					{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
      					{ "bluz71/vim-moonfly-colors" },
      					{ "ember-theme/nvim" },
      					{ "julien/vim-colors-green" },
      					{ "LazyVim/LazyVim", opts = { colorscheme = "moonfly" }, },

      					-- OPTIONAL: Import extra language/feature modules
      					-- Uncomment the ones you want:
      					-- { import = "lazyvim.plugins.extras.lang.typescript" },
      					-- { import = "lazyvim.plugins.extras.lang.json" },
      					-- { import = "lazyvim.plugins.extras.coding.mini-surround"},
      					-- { import = "lazyvim.plugins.extras.ui.treesitter-context" },

      					-- ADD YOUR OWN PLUGINS HERE:
      					-- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
      				},
      				defaults = {
      					lazy = false,      -- Load all plugins immediately (good for testing)
      					version = false,   -- Always use the latest git commit
      				},
      				install = { colorscheme = { "amber" } },
      				checker = { enabled = true },
      				change_detection = { notify = false },
      			})

      			-- --------------------------------------------
      			-- Your personal settings  
      			-- --------------------------------------------
      			vim.opt.tabstop = 3
      			vim.opt.shiftwidth = 3
      			vim.opt.expandtab = false
      			vim.opt.smartindent = true
      		'';
  };
}
