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

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf, silent = true }

    -- set keybinds
    opts.desc = "Show LSP references"
    map("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

    opts.desc = "Go to declaration"
    map("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

    opts.desc = "Show LSP definitions"
    map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

    opts.desc = "Show LSP implementations"
    map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

    opts.desc = "Show LSP type definitions"
    map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

    opts.desc = "See available code actions"
    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

    opts.desc = "Smart rename"
    map("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

    opts.desc = "Show buffer diagnostics"
    map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

    opts.desc = "Show line diagnostics"
    map("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

    opts.desc = "Go to previous diagnostic"
    map("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

    opts.desc = "Go to next diagnostic"
    map("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

    opts.desc = "Show documentation for what is under cursor"
    map("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

    opts.desc = "Restart LSP"
    map("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
  end,
})
