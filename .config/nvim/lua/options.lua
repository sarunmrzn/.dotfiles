vim.opt.backup = false
vim.opt.number = true
vim.opt.showmode = false
vim.opt.undofile = true
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)
vim.opt.completeopt = { 'menuone', 'noselect' }
vim.opt.conceallevel = 0
vim.opt.fileencoding = 'utf-8'
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.mouse = ''
vim.opt.pumheight = 10
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.timeoutlen = 300
vim.opt.updatetime = 250
vim.opt.writebackup = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.cursorline = false
vim.opt.relativenumber = true
vim.opt.numberwidth = 4
vim.opt.signcolumn = 'yes'
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8
vim.opt.errorbells = false
vim.opt.hidden = true
vim.opt.autoread = true
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.ls = 0
vim.opt.spell = true
vim.opt.breakindent = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.laststatus = 0
