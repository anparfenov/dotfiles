local utils = require("utils")
local lspconfig = require("lspconfig")
local null_ls = require("null-ls")
local luasnip = require("luasnip")
local home = os.getenv("HOME")

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
	"html",
	"tsserver",
	-- "volar", -- vue3
	"vuels", -- vue2
	"cssls",
	"racket_langserver",
	"svelte",
	"pyright",
	"intelephense", -- php
}

local cmp = require("cmp")

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-n>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif utils.has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-p>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
	}),
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

function on_attach(client)
	client.resolved_capabilities.document_formatting = false
	client.resolved_capabilities.document_range_formatting = false
end

-- Setup lspconfig.
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
for _, lsp in ipairs(servers) do
	-- objects in lua are called tables
	local options = {
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 100,
		},
	}
	if lsp == "ccls" then
		options = utils.merge_tables(options, {
			init_options = {
				compilationDatabaseDirectory = "build",
			},
		})
	elseif lsp == "tsserver" then
		options = utils.merge_tables(options, {
			on_attach = on_attach,
		})
	elseif lsp == "zls" then
		local zls_path = home .. "/Programs/zls/zig-out/bin/zls"
		print(zls_path)
		options = utils.merge_tables(options, {
			cmd = { zls_path },
		})
	end
	lspconfig[lsp].setup(options)
end

local sumneko_lua_root_path = home .. "/Programs/lua-language-server"
local sumneko_lua_binary = sumneko_lua_root_path .. "/bin/Linux/lua-language-server"
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require("lspconfig").sumneko_lua.setup({
	cmd = { sumneko_lua_binary, "-E", sumneko_lua_root_path .. "/main.lua" },
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = runtime_path,
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
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
})

require("luasnip.loaders.from_vscode").lazy_load()

vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.shortmess = vim.opt.shortmess + "c"

local sources = {
	null_ls.builtins.formatting.prettier.with({
		filetypes = {
			"html",
			"json",
			"yaml",
			"markdown",
			"typescript",
			"typescriptreact",
			"javascript",
			"javascriptreact",
			"svelte",
			"vue",
			"css",
			"scss",
			"jsx",
		},
	}),
	null_ls.builtins.code_actions.eslint,
	null_ls.builtins.code_actions.gitsigns,
	null_ls.builtins.diagnostics.luacheck,
	null_ls.builtins.formatting.stylua,
}

null_ls.setup({ sources = sources })
