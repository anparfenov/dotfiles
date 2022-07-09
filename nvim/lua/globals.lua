vim.g.conceallevel = 0

MY = { functions = {} }

function MY.functions.change_theme()
    local dark_theme = 'aurora'
    local light_theme = 'inspired-github'
    local default_theme = light_theme
    local current_theme = vim.g.colors_name
    if current_theme == dark_theme then
        current_theme = light_theme
    elseif current_theme == light_theme then
        current_theme = dark_theme
    else
        current_theme = default_theme
    end
    local cmd = 'colorscheme ' .. current_theme
    vim.cmd(cmd)
end
