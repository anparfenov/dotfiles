local nvim_tree =  require('nvim-tree')
local tree_cb = require'nvim-tree.config'.nvim_tree_callback

nvim_tree.setup ({
    view = {
        mappings = {
            list = {
                { key = { 'l', '<CR>' }, cb = tree_cb('edit') },
                { key = { 'h', '<BS>' }, cb = tree_cb('close_node') }
            }
        }
    }
})
