local use = require("packer").use

return require("packer").startup(function()
	use("wbthomason/packer.nvim")
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("antoinemadec/FixCursorHold.nvim")

	-- code tools
	use("editorconfig/editorconfig-vim")

	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")

	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")
    use("mattn/emmet-vim")

	use("jose-elias-alvarez/null-ls.nvim")

	use("Olical/conjure")

	use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })
	use({
		"nvim-orgmode/orgmode",
		config = function()
			require("orgmode").setup({})
		end,
	})

	-- languages
	use("ziglang/zig.vim")
	use("wlangstroth/vim-racket")
    use("lepture/vim-jinja")

	-- ui
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
	})
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	use("tjdevries/colorbuddy.vim")

	-- helpers
	use("tpope/vim-surround")
	use("tpope/vim-repeat")
	use("andymass/vim-matchup")
	use("b3nj5m1n/kommentary")
	use("jiangmiao/auto-pairs")
	use("mg979/vim-visual-multi")

	-- coloschemes
	use("Th3Whit3Wolf/onebuddy")
	use("sainnhe/everforest")
	use({ "dracula/vim", as = "dracula" })
	use("ray-x/aurora")
	use("rose-pine/neovim")
	use("EdenEast/nightfox.nvim")
	use("bluz71/vim-nightfly-guicolors")
	use("yonlu/omni.vim")
	use("folke/tokyonight.nvim")
	use("junegunn/seoul256.vim")
	use("mvpopuk/inspired-github.vim")
	use("habamax/vim-habaurora")
	use("projekt0n/github-nvim-theme")
	use("savq/melange")
	use("rktjmp/lush.nvim")
	use("metalelf0/jellybeans-nvim")
	use("Mofiqul/vscode.nvim")
	use("kvrohit/rasmus.nvim")
end)
