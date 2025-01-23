-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree toggle<CR>', desc = 'NeoTree toggle', silent = true },
  },
  config = function()
    require('neo-tree').setup {
      use_libuv_file_watcher = true,
      filesystem = {
        window = {
          mappings = {
            ['\\'] = 'close_window',
          },
        },
        filtered_items = {
          hide_dotfiles = true,
        },
        follow_current_file = {
          enabled = true,
        },
      },
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
    }
  end,
}
