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

	-- nvim-treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	-- === Theme ===
	-- Onedark
	use("ful1e5/onedark.nvim")

	-- === LSP ===
  use({ "neovim/nvim-lspconfig" })
	use({ "williamboman/nvim-lsp-installer", commit = "36b44679f7cc73968dbb3b09246798a19f7c14e0" })

	-- 补全引擎
	use("hrsh7th/nvim-cmp")
	-- snippet
	use("hrsh7th/vim-vsnip")
	-- 补全源
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
	use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
	use("hrsh7th/cmp-path") -- { name = 'path' }
	use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }

  -- 常见编程语言代码段
	use("rafamadriz/friendly-snippets")

	-- === UI ===
	-- lspkind-nvim
  use("onsails/lspkind-nvim")
  -- inden-blankline
	use("lukas-reineke/indent-blankline.nvim")

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
