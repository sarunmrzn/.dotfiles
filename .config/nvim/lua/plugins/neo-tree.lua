return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  lazy = true,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '<leader>e', '<cmd>Neotree toggle<cr>', desc = 'NeoTree' },
  },
  opts = {
    sort_function = function(a, b)
      -- Ensure directories come before files
      if a.type ~= b.type then
        return a.type < b.type
      end

      -- Apply natural sorting only to folders starting with "v" followed by a number
      local a_name = a.path:match 'v(%d+)'
      local b_name = b.path:match 'v(%d+)'

      if a_name and b_name then
        -- Convert extracted numbers to integers for numeric comparison
        return tonumber(a_name) < tonumber(b_name)
      else
        -- Default sorting behavior if the name pattern does not match
        return a.path < b.path
      end
    end,
    window = {
      mappings = {
        ['h'] = 'close_node',
      },
    },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
      },
      follow_current_file = {
        enabled = true,
      },
    },
  },
}
