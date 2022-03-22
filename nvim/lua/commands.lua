--[[ require('github-theme').setup({
    themeStyle = 'light'
}) ]]
-- Colorscheme
vim.cmd 'colorscheme melange'
-- vim.g.rose_pine_variant = 'dawn'
-- vim.g.edge_style = 'light'
-- vim.g.tokyonight_style = "day"

-- file settings
vim.cmd 'autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown'
vim.cmd 'autocmd BufNewFile,BufFilePre,BufRead *.pcss set filetype=css'
vim.cmd 'autocmd BufNewFile,BufFilePre,BufRead *.ejs set filetype=html'
vim.cmd 'autocmd BufNewFile,BufFilePre,BufRead *.njk set filetype=jinja'
vim.cmd 'autocmd BufNewFile,BufFilePre,BufRead Dockerfile* set filetype=dockerfile'
vim.cmd 'autocmd BufNewFile,BufFilePre,BufRead Caddyfile* set filetype=caddyfile'
vim.cmd 'autocmd BufNewFile,BufFilePre,BufRead config set filetype=config'
vim.cmd 'autocmd BufNewFile,BufFilePre,BufRead *.venn set virtualedit=all'
