local builtin = require('telescope.builtin')

local map = vim.keymap.set

map("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true})
map("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true})
map("n", "n", "nzzzv", { noremap = true, silent = true})
map("n", "N", "Nzzzv", { noremap = true, silent = true})

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })

map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- terminal
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "terminal escape terminal mode" })
map("n", "<leader>t", require('custom.terminal').toggle_terminal, { noremap = true, silent = true, desc = "Toggle terminal" })

-- telescope
map('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
map('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
map('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
map('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
