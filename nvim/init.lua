-- **************************************
-- 
-- nezaj's neovim config!
-- Now with lua!
-- aka: my attempt to get into the modern era of vim
--
-- (TODOS):
-- **************************************

-------------------
-- Settings
-------------------
vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = false

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.textwidth = 80


vim.o.ignorecase = true  -- Make searches case-insensitive
vim.o.smartcase = true   -- But case-sensitive if uppercase is used in the search
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
vim.api.nvim_set_option("clipboard","unnamed")

-- Auto save when switching buffers
vim.o.autowriteall = true

-- Leaders
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-------------------
-- Remaps
-------------------

-- Open nerdtree
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

-- Begin/end line navigation
vim.keymap.set("n", "H", "0w", { noremap = true })
vim.keymap.set("n", "L", "$", { noremap = true })

-- Clipboard copy
vim.keymap.set("v", "<leader>c", ":w !pbcopy<CR><CR>", { noremap = true, silent = true })

-- Clipboard paste
vim.keymap.set("n", "<leader>v", ":r !pbpaste<CR><CR>", { noremap = true, silent = true })

-- Tabs
vim.api.nvim_set_keymap('n', '<leader>1', '1gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>2', '2gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>3', '3gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>4', '4gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>5', '5gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>6', '6gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>7', '7gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>8', '8gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>9', '9gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>0', ':tablast<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>x', ':tabclose<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>t', ':0tabnew<CR>', { noremap = true, silent = true })


-------------------
-- Packer
--
-- Once upon a time I used pathogen, which I liked!
-- Then I switched to vim-plug, which I must admit was better
-- Now I'm on Packer. Is it better? I don't know yet...
-- But it looks like I'm already behind? There's something called Lazy now...
--
-- Such is vim life
-------------------

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

vim.cmd.packadd('packer.nvim')

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "single" }
    end,
  },
}

require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Fuzzy finder
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.4',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- colors
  use({
	  'kabouzeid/nvim-jellybeans',
    requires = "rktjmp/lush.nvim",
	  config = function()
		  vim.cmd('colorscheme jellybeans')
	  end
  })

  -- syntax highlighting
  use {
			'nvim-treesitter/nvim-treesitter',
			run = function()
				local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
				ts_update()
			end
    }

  -- Git things
  use("tpope/vim-fugitive")

  -- Comments
  use 'tomtom/tcomment_vim'

  -- Nerdtree
  use 'preservim/nerdtree'

  -- LSP
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  -- Clojure things
  use 'Olical/conjure'
  use 'guns/vim-sexp'
  use 'tpope/vim-sexp-mappings-for-regular-people'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'

  -- Copilot
  use 'github/copilot.vim'
end)

-------------------
-- Autocommands
-------------------
-- Autoformat
vim.api.nvim_create_augroup('LspFormatting', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', {
  group = 'LspFormatting',
  pattern = '*',
  callback = function()
    vim.lsp.buf.format()
  end,
})

-- Autosave
local autosave_group = vim.api.nvim_create_augroup("Autosave", { clear = true })

-- Create an autocommand to autosave on buffer leave
vim.api.nvim_create_autocmd("BufLeave", {
  group = autosave_group,
  pattern = "*",
  callback = function()
    -- Check if the buffer is modified before attempting to save
    if vim.bo.modified then
      vim.cmd("silent! w")
    end
  end,
})

-- **************************************
--
-- Plugin settings below. Beware, here be dragons
--
-- **************************************

-------------------
-- LSP
-- For all my intelisense needs
-------------------
local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
  "tailwindcss",
  "clojure_lsp",
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set("n", "<leader>vd", function()
      local opts = {
          scope = "cursor",
          focusable = true, -- Allow focusing the float window to enable copying text
          border = "rounded" -- Optional: style the border of the float window
      }
      vim.diagnostic.open_float(nil, opts)
  end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = false
})

-------------------
-- NERDTree
-- I couldn't get netrw working the way I like and NERDTree _just works_
-------------------
-- Files and directories I don't want to see
-- Note the use of vim-style regex
vim.g.NERDTreeIgnore = {
    '\\.\\(pyc\\|swp\\|db\\|coverage\\|DS_Store\\)$',
    '\\.\\(git\\|hg\\|svn\\|egg-info\\)$[[dir]]',
    '\\(coverage\\|pytests\\)\\.xml$',
}

-- I do want to see dotfiles (like .gitignore)
vim.g.NERDTreeShowHidden = 1

-- Pretty NERDTree
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeDirArrows = 1

-------------------
-- Telescope
-- Fuzzy-finder ftw!
-------------------
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>p', builtin.find_files, {})
vim.keymap.set('n', ';', ':Telescope buffers sort_lastused=true<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<leader>a', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

-------------------
-- Treesitter
-- Fancy color syntax highlighting. 
-------------------
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "vimdoc", "javascript", "typescript", "c", "lua", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

-------------------
-- Tcomment
-- Commenting made easy!
-------------------
vim.api.nvim_set_keymap('n', '//', ':TComment<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '//', ':TComment<CR>', { noremap = true, silent = true })

-------------------
-- Providers
-------------------
vim.g.python3_host_prog = '/opt/homebrew/bin/python3'
