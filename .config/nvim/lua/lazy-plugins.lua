require('lazy').setup({
  spec = {
    { import = 'plugins' },
  },
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'christoomey/vim-tmux-navigator',
  checker = { enabled = true },
}, {})
