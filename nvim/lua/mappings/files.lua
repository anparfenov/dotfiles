require('utils');

-- telescope
vim.api.nvim_set_keymap('n', '<leader><leader>', '<cmd>Telescope find_files<cr>', KEYMAP_OPTS)
vim.api.nvim_set_keymap('n', '<leader>f.', '<cmd>Telescope live_grep<cr>', KEYMAP_OPTS)
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', KEYMAP_OPTS)
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', KEYMAP_OPTS)
