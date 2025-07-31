-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true})
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true})
vim.keymap.set("n", "n", "nzzzv", { noremap = true, silent = true})
vim.keymap.set("n", "N", "Nzzzv", { noremap = true, silent = true})

function ToggleRelativeLineNumber() 
    vim.wo.relativenumber = not vim.wo.relativenumber
end

vim.keymap.set("n", "<leader>rl", ToggleRelativeLineNumber, { noremap = true, silent = true })
