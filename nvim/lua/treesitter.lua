require'nvim-treesitter.configs'.setup {
    ensure_installed = { "lua", "javascript", "typescript", "tsx", "css", "html", "python", "zig", "php" },
    highlight = {
        enable = true,
    },
    incremental_selection = {
        enable = true
    },
    indent = {
        enable = true
    },
    textobjects = {
        enable = true
    }
}
