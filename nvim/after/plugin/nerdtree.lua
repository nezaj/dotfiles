-- NERDTree
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
