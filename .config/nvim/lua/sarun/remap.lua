local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

keymap('n', '<C-h>', '<C-w><C-h>', opts)
keymap('n', '<C-l>', '<C-w><C-l>', opts)
keymap('n', '<C-j>', '<C-w><C-j>', opts)
keymap('n', '<C-k>', '<C-w><C-k>', opts)

keymap("n", "<leader>e", ":Neotree toggle<cr>", opts)

keymap('n', '<C-Up>', ':resize -2<CR>', opts)
keymap('n', '<C-Down>', ':resize +2<CR>', opts)
keymap('n', '<C-Left>', ':vertical resize -2<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize +2<CR>', opts)

keymap('n', '<S-H>', ':bnext<CR>', opts)
keymap('n', '<S-L>', ':bprevious<CR>', opts)

keymap('n', '<leader>oi', '<cmd>TSToolsOrganizeImports<cr>', opts)
keymap('n', '<leader>ru', '<cmd>TSToolsRemoveUnused<cr>', opts)
keymap('n', '<leader>ia', '<cmd>TSToolsAddMissingImports<cr>', opts)
keymap('n', '<leader>fa', '<cmd>TSToolsFixAll<cr>', opts)

keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

keymap('v', 'p', '"_dP', opts)

keymap('x', 'J', ":move '>+1<CR>gv-gv", opts)
keymap('x', 'K', ":move '<-2<CR>gv-gv", opts)
