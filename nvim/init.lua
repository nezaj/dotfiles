-- **************************************
-- 
-- nezaj's neovim config!
-- Now with lua and lazy.nvim!
--
-- Big thanks to Claude for helping me migrate this from Packer.
-- With the help of AI, I think migrating vim tooling will be better
-- than evar!
-- **************************************

-------------------
-- Bootstrap lazy.nvim
-------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

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

-- Open neo-tree
vim.keymap.set("n", "<leader>nt", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neo-tree" })

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

-- Copilot
vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true }) -- Sometimes tab doesn't work

-------------------
-- Lazy.nvim plugins
-------------------
require("lazy").setup({
  -- Telescope (Fuzzy finder)
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<leader>p', function() require('telescope.builtin').find_files() end },
      { ';', '<cmd>Telescope buffers sort_lastused=true<CR>', noremap = true, silent = true },
      { '<leader>g', function() require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") }) end },
      { '<leader>vh', function() require('telescope.builtin').help_tags() end },
    },
    opts = {
      defaults = {
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        prompt_prefix = "  ",
        selection_caret = "  ",
        entry_prefix = "  ",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.5,
            results_width = 0.5,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        results_title = false,
        path_display = { "truncate" },
      }
    }
  },

  -- Color scheme
  {
    'kabouzeid/nvim-jellybeans',
    dependencies = { "rktjmp/lush.nvim" },
    priority = 1000, -- Load colorscheme early
    config = function()
      vim.cmd('colorscheme jellybeans')
    end,
  },

  -- Treesitter syntax highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = { "vimdoc", "javascript", "typescript", "c", "lua", "rust" },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    },
  },

  -- Git integration
  { 'tpope/vim-fugitive' },
  { 'tpope/vim-rhubarb' },
  
  -- Comments
  { 
    'tomtom/tcomment_vim',
    keys = {
      { '//', ':TComment<CR>', mode = {'n', 'v'}, noremap = true, silent = true },
    },
  },

  -- Neo-tree file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>nt", "<cmd>Neotree toggle<CR>", desc = "Toggle Neo-tree" },
    },
    opts = function()
      -- Detect if we should use simple icons
      local use_icons = not vim.g.use_simple_icons
      
      -- Configure icons based on detection
      local simple_icons = {
        default = "F",
        open = "O",
        empty = "E",
        empty_open = "EO",
        symlink = "L",
        symlink_open = "LO",
      }
      
      return {
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
        filesystem = {
          filtered_items = {
            visible = false,
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_by_name = {
              ".git",
              ".hg",
              ".svn",
              ".DS_Store",
            },
            hide_by_pattern = {
              "*.pyc",
              "*.swp",
              "*.db",
              "*.coverage",
              "*egg-info",
              "coverage.xml",
              "pytests.xml",
            },
          },
          window = {
            mappings = {
              ["o"] = "open",
              ["s"] = "order_by_type", 
            },
          },
        },
        window = {
          position = "left",
          width = 30,
          mappings = {
            ["<space>"] = "none",
            ["o"] = "open",
            ["s"] = "order_by_type", 
            -- Explicitly disable other potentially conflicting mappings
            ["O"] = "none",
            ["oc"] = "none",
            ["od"] = "none",
            ["og"] = "none",
            ["om"] = "none",
            ["on"] = "none",
            ["os"] = "none",
            ["ot"] = "none",
          },
        },
        sources = {
          "filesystem",
          "buffers",
          "git_status",
        },
        source_selector = {
          winbar = true,
          content_layout = "center",
          sources = {
            { source = "filesystem", display_name = use_icons and " Files" or "Files" },
            { source = "buffers", display_name = use_icons and " Buffers" or "Buffers" },
            { source = "git_status", display_name = use_icons and " Git" or "Git" },
          },
          -- Add separator between tabs
          tabs_layout = "equal",
          separator = { left = "▏", right= "▕" },
        },
        default_component_configs = {
          icon = {
            folder_closed = use_icons and "" or simple_icons.default,
            folder_open = use_icons and "" or simple_icons.open,
            folder_empty = use_icons and "" or simple_icons.empty,
            folder_empty_open = use_icons and "" or simple_icons.empty_open,
            default = use_icons and "" or "-",
          },
          modified = {
            symbol = use_icons and "●" or "*",
          },
          git_status = {
            symbols = {
              -- Change type
              added     = use_icons and "" or "A",
              deleted   = use_icons and "" or "D",
              modified  = use_icons and "" or "M",
              renamed   = use_icons and "" or "R",
              -- Status type
              untracked = use_icons and "" or "?",
              ignored   = use_icons and "" or "!",
              unstaged  = use_icons and "" or "U",
              staged    = use_icons and "" or "S",
              conflict  = use_icons and "" or "C",
            }
          },
        },
        ui = {
          default = {
            enable_character_fade = true,
          },
        },
      }
    end,
  },

  -- LSP Configuration
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {
        'williamboman/mason.nvim',
        opts = {},
      },
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
    },
    config = function()
      local lsp = require("lsp-zero")
      
      lsp.preset("recommended")
      
      lsp.ensure_installed({
        "tailwindcss",
        "clojure_lsp",
        "ts_ls"
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
        mapping = cmp_mappings,
        window = {
          completion = cmp.config.window.bordered(border_opts),
          documentation = cmp.config.window.bordered(border_opts),
        },
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
            vim.diagnostic.open_float(nil, {
                scope = "cursor",
                focusable = true,
                border = "rounded"
            })
        end, opts)
      end)
      
      lsp.setup()
      
      -- Configure floating windows for diagnostics
      vim.diagnostic.config({
          virtual_text = false,
          float = {
            border = "rounded",
            focusable = true,
            style = "minimal",
            source = "always",
            header = "",
            prefix = "",
          },
      })
      
      -- Configure hover and signature help windows
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover, { border = "rounded" }
      )
      
      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help, { border = "rounded" }
      )
    end
  },

  -- LLM pair programmer
  {
    "yetone/avante.nvim",
    enabled = false,  -- Temporarily disable until we can fix the issues
    build = "make",
    config = function()
      require("avante").setup()
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
  },

  -- Clojure things
  { 'Olical/conjure' },
  { 'guns/vim-sexp' },
  { 'tpope/vim-sexp-mappings-for-regular-people' },
  { 'tpope/vim-repeat' },
  { 'tpope/vim-surround' },

  -- JavaScript
  {
    'MunifTanjim/prettier.nvim',
    opts = {
      bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
      filetypes = {
        "css",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "less",
        "markdown",
        "scss",
        "typescript",
        "typescriptreact",
        "yaml",
      },
    },
  },

  -- Copilot
  { 
    'github/copilot.vim',
    event = "InsertEnter",
  }
})

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

-------------------
-- Python Provider
-------------------
vim.g.python3_host_prog = '/opt/homebrew/bin/python3'
