return {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "jay-babu/mason-null-ls.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    local mason_null_ls = require("mason-null-ls")

    -- Setup mason-null-ls with auto-install
    mason_null_ls.setup({
      ensure_installed = {
        "prettierd",
        "stylua",
      },
      automatic_installation = true,
    })

    -- Setup formatting
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettierd.with({
          filetypes = { "javascript", "typescript" },
        }),
        null_ls.builtins.formatting.stylua,
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({
                bufnr = bufnr,
                async = false,
                timeout_ms = 500,
              })
            end,
          })
        end
      end,
    })

    -- Optional keymap
    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      vim.lsp.buf.format({
        async = false,
        timeout_ms = 500,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
