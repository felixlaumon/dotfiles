return {
  {
    "kevinhwang91/nvim-ufo",
    lazy = true,

    dependencies = {
      { "kevinhwang91/promise-async", lazy = true },
    },

    init = function()
      vim.o.foldcolumn = "0"
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }
      local language_servers = require("lspconfig").util.available_servers()
      for _, ls in ipairs(language_servers) do
        require("lspconfig")[ls].setup {
          capabilities = capabilities,
        }
      end
      require("ufo").setup()
    end,

    keys = {
      { "zO", function() require("ufo").openAllFolds() end,  desc = "Open all folds" },
      { "zC", function() require("ufo").closeAllFolds() end, desc = "Close all folds" },
    },
  },
}
