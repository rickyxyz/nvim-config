return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = {
    "mason-org/mason.nvim",
  },
  config = function()
    local mason_tool_installer = require("mason-tool-installer")

    mason_tool_installer.setup({
      ensure_installed = {
        "lua_ls",
        "ts_ls",
        "tailwindcss",
        "cssls",
        "html",
        "prettier",
        "stylua",
        "eslint_d",
        "emmet_language_server",
        "jsonls",
      },
    })
  end,
}
