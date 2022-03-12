vim.g.mapleader = ' '

vim.api.nvim_set_keymap('i', '<C-u>', '<C-g>u<C-u>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-w>', '<C-g>u<C-w>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader><leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', {});

vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>ALEFix<cr>', { noremap = true });

-- clear hightlights
vim.api.nvim_set_keymap('n', '<C-l>', '<cmd>noh<CR>', { noremap = true })

-- indenting
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })

-- save
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-s>', '<Esc>:w<CR>a', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>a', '<cmd>edit ~/.config/nvim/init.lua<CR>', { noremap = true })

-- don't jump to the next word
vim.api.nvim_set_keymap('n', '*', '*N', { noremap = true })

vim.api.nvim_set_keymap('n', 'Q', 'gq', { noremap = true })

vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true })

-- fuzzy finder
vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>FzfLua files<cr>', { noremap = true })

-- nvim tree
vim.api.nvim_set_keymap('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>r', '<cmd>NvimTreeRefresh<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>n', '<cmd>NvimTreeFindFile<CR>', { noremap = true })

-- Move current line / block with Alt-j/k ala vscode.
vim.api.nvim_set_keymap("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "<A-j>", ":m '>+1<CR>gv-gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "<A-k>", ":m '<-2<CR>gv-gv", { noremap = true, silent = true })

-- QuickFix
vim.api.nvim_set_keymap("n", "]q", ":cnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "[q", ":cprev<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("", "<C-q>", ":call QuickFixToggle()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<A-a>", "<C-a>", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-x>", "<C-x>", { noremap = true })

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
    -- default mappings
vim.g.nvim_tree_bindings = {
    { key = {"<CR>", "o", "<2-LeftMouse>", "l"}, cb = tree_cb("edit") },
    { key = "<BS>",                         cb = tree_cb("close_node") },
    { key = "h",                            cb = tree_cb("close_node") },
}
