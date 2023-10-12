local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local packer_status, packer = pcall(require, "packer")
if not packer_status then
	print("Packer Not Found")
	return 
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
    use { "wbthomason/packer.nvim" }
	use { "nvim-lua/plenary.nvim" }
	use { "morhetz/gruvbox" }
	use { "nvim-telescope/telescope.nvim" }
	use { "nvim-treesitter/nvim-treesitter" }
	use { "windwp/nvim-autopairs" }
	use { "lewis6991/gitsigns.nvim" }
	use { "numToStr/Comment.nvim" }

	-- CMP 
	use { "hrsh7th/nvim-cmp" } -- The completion plugin
	use { "hrsh7th/cmp-buffer" } -- Buffer completions
	use { "hrsh7th/cmp-path" } -- Path completions
	use { "saadparwaiz1/cmp_luasnip" }
	use { "hrsh7th/cmp-nvim-lsp" }
	use { "hrsh7th/cmp-nvim-lua" }

	-- Snippets
	use { "L3MON4D3/LuaSnip" } -- Snippet engine
	use { "rafamadriz/friendly-snippets" } -- Bunch of snippets to use

	-- LSP
	use { "neovim/nvim-lspconfig" } -- Enable LSP
	use { "williamboman/mason.nvim" } -- Simple to use language server installer
	use { "williamboman/mason-lspconfig.nvim" }
	use { "jose-elias-alvarez/null-ls.nvim" } -- Formatters and linters
	use { "RRethy/vim-illuminate" }

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

