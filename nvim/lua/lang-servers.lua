local lspconfig = require('lspconfig')
local home = os.getenv('HOME')

function merge_tables(a, b)
    local c = {}
    for k,v in pairs(a) do c[k] = v end
    for k,v in pairs(b) do c[k] = v end
    return c
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
    "html",
    "tsserver",
    "volar",
    "ccls",
    "cssls",
    "graphql",
    "hls",
    "racket_langserver",
    "svelte",
    "gopls",
    "dartls",
    "zls"
}


local cmp = require'cmp'

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        end,
    },
    mapping = {
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
    }, {
            { name = 'buffer' },
        })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
            { name = 'cmdline' }
        })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
for _, lsp in ipairs(servers) do
    -- objects in lua are called tables
    local options = {
        capabilities = capabilities,
        flags = {
            debounce_text_changes = 100,
        }
    }
    if (lsp == 'ccls') then
        options = merge_tables(options, {
            init_options = {
                compilationDatabaseDirectory = "build";
            }
        })
    elseif lsp == 'zls' then
        local zls_path = home .. '/Programs/zls/zig-out/bin/zls'
        print(zls_path)
        options = merge_tables(options, {
            cmd = { zls_path }
        })
    end
    lspconfig[lsp].setup(options)
end

local sumneko_lua_root_path = home .. '/Programs/lua-language-server'
local sumneko_lua_binary = sumneko_lua_root_path .. '/bin/Linux/lua-language-server'
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_lua_binary, "-E", sumneko_lua_root_path .. "/main.lua"};
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = runtime_path,
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}

vim.opt.completeopt = 'menuone,noinsert,noselect'
vim.opt.shortmess = vim.opt.shortmess + 'c'

--[[ vim.g.ale_linters = {
    typescript = {'eslint'},
    javascript = { 'eslint' },
    svelte = { 'eslint' },
    vue = { 'eslint' },
    css = { 'stylelint' },
    scss = { 'stylelint' },
    jsx = {'stylelint', 'eslint'},
    go = {'gopls'}
}

vim.g.ale_fixers = {
    ['*'] = {'remove_trailing_lines', 'trim_whitespace'},
    javascript = { 'prettier', 'eslint' },
    typescript = { 'prettier', 'eslint' },
    ['javascript.jsx'] = { 'prettier', 'eslint' },
    ['typescript.tsx'] = { 'prettier', 'eslint' },
    json = { 'prettier' },
    svelte = { 'prettier' },
    vue = { 'prettier' },
    html = { 'prettier' },
    css = { 'stylelint' },
    scss = { 'stylelint' },
} ]]
