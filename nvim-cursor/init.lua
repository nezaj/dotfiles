-------------------
-- Settings
-------------------
vim.opt.guicursor = ""
vim.opt.number = true
vim.opt.relativenumber = false

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.textwidth = 80

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"

-- Configure netrw
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 4
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- Yank/paste to/from system clipboard
vim.opt.clipboard = "unnamedplus"

-- Auto save when switching buffers
vim.opt.autowriteall = true

-- Leaders
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-------------------
-- Remaps (Safe for Cursor)
-------------------

-- Move code blocks
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

-- Page navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz", { silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = true })

-- Scroll between search results
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Delete without copying
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Yank to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Format with LSP
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

-- Exit insert mode quickly
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })

-- Save/quit
vim.keymap.set("n", "<leader>w", ":w<CR>", { silent = true })
vim.keymap.set("n", "<leader>q", ":q!<CR>", { silent = true })
vim.keymap.set("n", "<leader>zz", ":qa!<CR>", { silent = true })

-- Clear search
vim.keymap.set("n", "<leader>/", ":nohlsearch<CR>", { silent = true })

-------------------
-- Autocommands
-------------------
-- Autoformat before save
vim.api.nvim_create_augroup('LspFormatting', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', {
  group = 'LspFormatting',
  pattern = '*',
  callback = function()
    vim.lsp.buf.format()
  end,
})

-------------------
-- Python Provider
-------------------
vim.g.python3_host_prog = '/opt/homebrew/bin/python3'
