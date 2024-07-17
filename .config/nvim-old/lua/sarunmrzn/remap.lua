---@diagnostic disable: undefined-global
local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap Space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.tmux_navigator_no_mappings = 1

-- Tree Toggle --
keymap("n", "<leader>e", ":Neotree toggle<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-H>", ":bnext<CR>", opts)
keymap("n", "<S-L>", ":bprevious<CR>", opts)

-- Telescope --
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>fr", "<cmd>Telescope resume<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>fc", "<cmd>Telescope commands<cr>", opts)

-- Typescript --
keymap("n", "<leader>oi", "<cmd>TSToolsOrganizeImports<cr>", opts)
keymap("n", "<leader>ru", "<cmd>TSToolsRemoveUnused<cr>", opts)
keymap("n", "<leader>ia", "<cmd>TSToolsAddMissingImports<cr>", opts)
keymap("n", "<leader>fa", "<cmd>TSToolsFixAll<cr>", opts)

-- Lazy Git --
keymap("n", "<leader>G", "<cmd>lua _LAZYGIT_TOGGLE()<cr>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("v", "p", '"_dP', opts)
-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
