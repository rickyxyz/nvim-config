return {
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    opts = {
      ensure_installed = {
        "lua_ls",
        "ts_ls",
        "tailwindcss",
        "cssls",
        "html",
        "emmet_language_server",
        "jsonls",
      },
      automatic_installation = true,
    },
  },
}
