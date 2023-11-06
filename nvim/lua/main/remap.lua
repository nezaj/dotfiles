-- Open netrw
vim.keymap.set("n", "<leader>nt", vim.cmd.NERDTree)

-- Move code blocks 
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Page up / Page down 
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Scroll between blocks
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Join lines and keep cursor
vim.keymap.set("n", "J", "mzJ`z")

-- Delete without copying to buffer
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- yank
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Format
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

-- Navigation
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "j", "gj", { noremap = true })
vim.keymap.set("n", "k", "gk", { noremap = true })

-- Window cycling 
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true })

-- Save/quit
vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true })
vim.keymap.set("n", "<leader>q", ":q!<CR>", { noremap = true })
vim.keymap.set("n", "<leader>zz", ":qa!<CR>", { noremap = true })

-- Reload vimrc file
vim.keymap.set("n", "<leader>sv", ":so $MYVIMRC<CR>", { noremap = true, silent = true })

-- Edit useful files
vim.keymap.set("n", "<leader>ev", ":e $MYVIMRC<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>et", ":e $MYTMUXCONF<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ez", ":e $MYZSH<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ep", ":e $MYPROFILE<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ed", ":e $MYTODOS<CR>", { noremap = true, silent = true })

-- Clear search
vim.keymap.set("n", "<leader>/", ":nohlsearch<CR>", { noremap = true, silent = true })

-- Command Mode
vim.keymap.set("n", ";", ":", { noremap = true })

-- Begin/end line navigation
vim.keymap.set("n", "H", "0w", { noremap = true })
vim.keymap.set("n", "L", "$", { noremap = true })

-- Clipboard copy
vim.keymap.set("v", "<leader>c", ":w !pbcopy<CR><CR>", { noremap = true, silent = true })

-- Clipboard paste
vim.keymap.set("n", "<leader>v", ":r !pbpaste<CR><CR>", { noremap = true, silent = true })
