-- This is a minimal init.lua for use with Cursor
-- Only include essential settings that don't conflict with Cursor/VSCode

-- Basic settings
vim.opt.guicursor = ""
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Set leader key
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Use system clipboard
vim.api.nvim_set_option("clipboard","unnamed")

-- Basic navigation in normal mode
vim.keymap.set("n", "j", "gj", { noremap = true })
vim.keymap.set("n", "k", "gk", { noremap = true })
vim.keymap.set("n", "H", "0w", { noremap = true })
vim.keymap.set("n", "L", "$", { noremap = true })

-- Quick escape from insert mode
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })

-- Keep cursor centered when navigating
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Clear search highlighting
vim.keymap.set("n", "<leader>/", ":nohlsearch<CR>", { noremap = true, silent = true })
