-- Window
vim.opt.termguicolors = true
vim.opt.updatetime = 50
vim.opt.laststatus = 3
vim.opt.showcmd = false

-- Number column
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'

-- Cursor
vim.opt.scrolloff = 99
vim.opt.cursorline = true

-- Tabs
local tabSize = 4

vim.opt.tabstop = tabSize
vim.opt.softtabstop = tabSize
vim.opt.shiftwidth = tabSize

vim.opt.expandtab = false

-- Indenting
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.g.autoformat = false

-- Whitespace Hints
vim.opt.list = true
vim.opt.listchars = 'tab:┃ ,trail:*,multispace:*,leadmultispace:┃...,nbsp:+'
vim.opt.showbreak = '--> '

-- Wrapping
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.wrap = false

-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- View Splitting
vim.opt.splitright = true
vim.opt.splitbelow = true

-- UX
vim.opt.confirm = true
