-- optionally enable 24-bit colour
vim.opt.termguicolors = true

local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)
end

return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({
            git = {
                enable = true,
                -- show_on_dirs = false
            },
            diagnostics = {
                enable = true,
                show_on_dirs = false,
                debounce_delay = 50,
                icons = { -- Customize per‑severity icons
                    hint = "",
                    info = "",
                    warning = "",
                    error = "",
                },
            },
            sort = {
                sorter = "case_sensitive",
            },
            view = {
                width = 30,
            },
            renderer = {
                group_empty = true,
                highlight_git = "all"
            },
            filters = {
                dotfiles = false,
            },
        })
    end,
}
