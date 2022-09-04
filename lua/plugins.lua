local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
	'git',
	'clone',
	'--depth',
	'1',
	'https://github.com/wbthomason/packer.nvim',
	install_path
})
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("No found packer.nvim")
  return
end

packer.init({
	max_jobs = 16,
	git = {
      -- default_url_format = "https://hub.fastgit.xyz/%s",
      -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
      -- default_url_format = "https://gitcode.net/mirrors/%s",
      -- default_url_format = "https://gitclone.com/github.com/%s",
    },
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return require('packer').startup(function(use)

	-- Packer can manage itself
  use("wbthomason/packer.nvim")

	-- nvim-tree
 	use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })

	-- bufferline
	use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})

	-- lualine
	use({ "nvim-lualine/lualine.nvim",requires = { "kyazdani42/nvim-web-devicons", opt = true }})
	use("arkav/lualine-lsp-progress")

	-- dashboard
	use("glepnir/dashboard-nvim")

	-- telescope
  use({ 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } })
	use("nvim-telescope/telescope-rg.nvim")

	-- project
use("ahmedkhalf/project.nvim")

	-- nvim-treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	-- nvim-auropairs
	use ({	"windwp/nvim-autopairs" })

	-- comment.nvim
	use ({ "numToStr/Comment.nvim" })

	-- surround.nvim
	use ({ "ur4ltz/surround.nvim" })

	-- === Theme ===	
	-- onedark
	-- use("ful1e5/onedark.nvim")

	-- nightfox
	-- use("EdenEast/nightfox.nvim")

	-- tokyonight
  use("folke/tokyonight.nvim")

	-- === LSP ===
  use({ "neovim/nvim-lspconfig" })
	use({ "williamboman/nvim-lsp-installer", commit = "36b44679f7cc73968dbb3b09246798a19f7c14e0" })

	-- === cmp ===
	use("hrsh7th/nvim-cmp")
	-- snippet
	use("hrsh7th/vim-vsnip")

	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
	use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
	use("hrsh7th/cmp-path") -- { name = 'path' }
	use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }

  -- 常见编程语言代码段
	use("rafamadriz/friendly-snippets")

	-- null-ls
	-- use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })

	-- === Markdown ===
	-- use ("iamcco/markdown-preview.nvim")

  -- === git ===
	use("lewis6991/gitsigns.nvim") -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)}

	-- === UI ===
	-- lspkind-nvim
  use("onsails/lspkind-nvim")

  -- inden-blankline
	use("lukas-reineke/indent-blankline.nvim")

	-- lspsaga 
	use("glepnir/lspsaga.nvim")

	-- === tools ===
	-- suda
	use("lambdalisue/suda.vim")

  -- vim-visual-multi
	use("mg979/vim-visual-multi")

	-- session-manager
	use("Shatur/neovim-session-manager")

	-- sniprun
  use({ 'michaelb/sniprun', run = 'bash ./install.sh'})
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
