local use = require('packer').use

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'ibhagwan/fzf-lua',
        requires = {
            'vijaymarupudi/nvim-fzf',
            'kyazdani42/nvim-web-devicons' } -- optional for icons
    }
    use 'mhinz/vim-grepper'

    -- code tools
    use 'editorconfig/editorconfig-vim'
    use 'dense-analysis/ale'

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    use 'neovim/nvim-lspconfig'

    use 'L3MON4D3/LuaSnip'
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            }
        end
    }
    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

    -- languages
    use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
    use 'pangloss/vim-javascript'
    use 'maxmellon/vim-jsx-pretty'
    use {'evanleck/vim-svelte', branch='main'}
    use 'lepture/vim-jinja'

    -- ui
    use {
        'glepnir/galaxyline.nvim',
        branch = 'main',
        -- some optional icons
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons'
        }
    }
    use 'tjdevries/colorbuddy.vim'

    -- helpers
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'andymass/vim-matchup'
    use 'b3nj5m1n/kommentary'
    use 'jiangmiao/auto-pairs'

    -- coloschemes
    use 'Th3Whit3Wolf/onebuddy'
    use 'sainnhe/everforest'
    use {'dracula/vim', as = 'dracula'}
    use 'folke/tokyonight.nvim'
    use 'yonlu/omni.vim'
    use 'ray-x/aurora'
    use 'rose-pine/neovim'
    use 'projekt0n/github-nvim-theme'
    use 'bluz71/vim-nightfly-guicolors'
    use 'EdenEast/nightfox.nvim'
    use "savq/melange"
end)
