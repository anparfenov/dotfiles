vim.opt.hidden          = true
vim.opt.secure          = true
vim.opt.title           = true
vim.opt.lazyredraw      = true
vim.opt.splitright      = true
vim.opt.modeline        = false
vim.opt.ttimeout        = true
vim.opt.wildignorecase  = true
vim.opt.expandtab       = true
vim.opt.shiftround      = true
vim.opt.ignorecase      = true
vim.opt.smartcase       = true
vim.opt.undofile        = true
vim.opt.magic           = true
vim.opt.number          = true
vim.opt.tags            = "" -- let gutentags handle this

vim.opt.undolevels      = 1000
vim.opt.ttimeoutlen     = 20
vim.opt.shiftwidth      = 4
vim.opt.softtabstop     = 4
vim.opt.tabstop         = 4
vim.opt.synmaxcol       = 200
vim.opt.cmdheight       = 2
vim.opt.updatetime      = 200
vim.opt.conceallevel    = 2
vim.opt.cscopetagorder  = 0
vim.opt.cscopepathcomp  = 3
vim.opt.showbreak       = string.rep(' ', 3) -- Make it so that long lines wrap smartly

vim.opt.mouse           = "nv"
vim.opt.wildignore      = '*/dist*/*,*/target/*,*/builds/*,*/node_modules/*,*/flow-typed/*,*.png,*.PNG,*.jpg,*.jpeg,*.JPG,*.JPEG,*.pdf,*.exe,*.o,*.obj,*.dll,*.DS_Store,*.ttf,*.otf,*.woff,*.woff2,*.eot'

-- UI OPTS
vim.opt.termguicolors  = true
