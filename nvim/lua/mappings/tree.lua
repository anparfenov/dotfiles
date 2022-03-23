require('utils')

vim.api.nvim_set_keymap('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', KEYMAP_OPTS)
vim.api.nvim_set_keymap('n', '<leader>r', '<cmd>NvimTreeRefresh<CR>', KEYMAP_OPTS)
vim.api.nvim_set_keymap('n', '<leader>n', '<cmd>NvimTreeFindFile<CR>', KEYMAP_OPTS)
