local nvim_tree =  require('nvim-tree')

nvim_tree.setup ({
    view = {
        mappings = {
            list = {
                { key = { 'l', '<CR>' }, action = 'edit' },
                { key = { 'h', '<BS>' }, action = 'close_node' }
            }
        }
    }
})
