local use = require('packer').use

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'antoinemadec/FixCursorHold.nvim'

    -- code tools
    use 'editorconfig/editorconfig-vim'

    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

    -- languages
    use 'ziglang/zig.vim'

    -- ui
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/plenary.nvim'}}
    }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons'
        }
    }

    -- helpers
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'andymass/vim-matchup'
    use 'b3nj5m1n/kommentary'
    use 'jiangmiao/auto-pairs'

    -- coloschemes
    --[[ use 'Th3Whit3Wolf/onebuddy'
    use 'sainnhe/everforest'
    use {'dracula/vim', as = 'dracula'}
    use 'folke/tokyonight.nvim'
    use 'yonlu/omni.vim'
    use 'ray-x/aurora'
    use 'rose-pine/neovim'
    use 'projekt0n/github-nvim-theme'
    use 'bluz71/vim-nightfly-guicolors'
    use 'EdenEast/nightfox.nvim'
     ]]
    use "savq/melange"
end)
