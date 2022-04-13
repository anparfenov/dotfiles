vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.VM_maps = {
	["Find Under"] = "<M-d>",
	["Find Subword Under"] = "<M-d>",
}

local utils = require("utils")
require("mappings.files")
require("mappings.lsp")
require("mappings.tree")
require("mappings.snips")

-- clear hightlights
vim.api.nvim_set_keymap("n", "<C-l>", "<cmd>noh<CR>", KEYMAP_OPTS)

-- indenting
vim.api.nvim_set_keymap("v", "<", "<gv", KEYMAP_OPTS)
vim.api.nvim_set_keymap("v", ">", ">gv", KEYMAP_OPTS)

-- save
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", KEYMAP_OPTS)
vim.api.nvim_set_keymap("i", "<C-s>", "<Esc>:w<CR>a", KEYMAP_OPTS)

vim.api.nvim_set_keymap("n", "<leader>a", "<cmd>edit ~/.config/nvim/init.lua<CR>", KEYMAP_OPTS)
vim.api.nvim_set_keymap("n", "<leader>d", ":lua vim.diagnostic.open_float()<cr>", KEYMAP_OPTS)

-- don't jump to the next word
vim.api.nvim_set_keymap("n", "*", "*N", KEYMAP_OPTS)

-- useless command
vim.api.nvim_set_keymap("n", "Q", "gq", KEYMAP_OPTS)

vim.api.nvim_set_keymap("i", "jk", "<Esc>", KEYMAP_OPTS)

-- Move current line / block with Alt-j/k ala vscode.
vim.api.nvim_set_keymap("n", "<A-j>", ":m .+1<CR>==", KEYMAP_OPTS)
vim.api.nvim_set_keymap("n", "<A-k>", ":m .-2<CR>==", KEYMAP_OPTS)
vim.api.nvim_set_keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", KEYMAP_OPTS)
vim.api.nvim_set_keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", KEYMAP_OPTS)
vim.api.nvim_set_keymap("x", "<A-j>", ":m '>+1<CR>gv-gv", KEYMAP_OPTS)
vim.api.nvim_set_keymap("x", "<A-k>", ":m '<-2<CR>gv-gv", KEYMAP_OPTS)

-- QuickFix
vim.api.nvim_set_keymap("n", "]q", ":cnext<CR>", KEYMAP_OPTS)
vim.api.nvim_set_keymap("n", "[q", ":cprev<CR>", KEYMAP_OPTS)

vim.api.nvim_set_keymap("", "<C-q>", ":call QuickFixToggle()<CR>", KEYMAP_OPTS)

-- add number
vim.api.nvim_set_keymap("n", "<A-a>", "<C-a>", KEYMAP_OPTS)
vim.api.nvim_set_keymap("n", "<A-x>", "<C-x>", KEYMAP_OPTS)

vim.api.nvim_set_keymap("i", "<C-u>", "<C-g>u<C-u>", KEYMAP_OPTS)
vim.api.nvim_set_keymap("i", "<C-w>", "<C-g>u<C-w>", KEYMAP_OPTS)

vim.api.nvim_set_keymap("n", "<C-T>", ":lua MY.functions.change_theme()<cr>", KEYMAP_OPTS)
