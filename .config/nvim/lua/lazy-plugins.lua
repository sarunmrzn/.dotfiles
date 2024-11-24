require('lazy').setup({
  spec = {
    { import = 'plugins' },
  },
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'christoomey/vim-tmux-navigator',

  -- require 'plugins/gitsigns',
  --
  -- require 'plugins/telescope',
  --
  -- require 'plugins/lspconfig',
  --
  -- require 'plugins/conform',
  --
  -- require 'plugins/cmp',
  --
  -- require 'plugins/tokyonight',
  --
  -- require 'plugins/todo-comments',
  --
  -- require 'plugins/mini',
  --
  -- require 'plugins/treesitter',
  --
  -- -- require 'plugins.debug',
  -- require 'plugins.indent_line',
  -- require 'plugins.lint',
  -- require 'plugins.autopairs',
  -- require 'plugins.neo-tree',

  checker = { enabled = true },
}, {})
