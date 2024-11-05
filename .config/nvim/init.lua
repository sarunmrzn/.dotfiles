local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true
vim.g.tmux_navigator_no_mappings = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require 'sarun.set'
require 'sarun.remap'
require 'sarun.autocmd'

require('lazy').setup {
  require 'plugins.lazydev',
  require 'plugins.telescope',
  require 'plugins.lsp',
  require 'plugins.conform',
  require 'plugins.autocomplete',
  require 'plugins.theme',
  require 'plugins.mini',
  require 'plugins.treesitter',
  require 'plugins.debug',
  require 'plugins.indent_line',
  require 'plugins.lint',
  require 'plugins.autopairs',
  require 'plugins.neo-tree',
  require 'plugins.gitsigns',
  require 'plugins.comments',
  require 'plugins.harpoon',
  require 'plugins.toggleterm',
  require 'plugins.typescript',
  'tpope/vim-sleuth',
  'christoomey/vim-tmux-navigator',
}
