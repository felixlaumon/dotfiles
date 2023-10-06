return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "isort",
        "pyright",
        "ruff",
        "shellcheck",
        "shfmt",
        "stylua",
        "svelte-language-server",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "<leader>co", "<cmd>PyrightOrganizeImports<cr>", desc = "Pyright Organize Imports" }
    end,
    opts = {
      diagnostics = {
        virtual_text = { severity = vim.diagnostic.severity.ERROR },
      },
    },
  },

  {
    "hrsh7th/cmp-nvim-lsp",
    opts = function()
      local cmp = require("cmp")
      return {
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
      }
    end,
  },

  {
    "nvimtools/none-ls.nvim",
    opts = function()
      local nls = require("null-ls")
      return {
        sources = {
          nls.builtins.formatting.black.with({ extra_args = { "--line-length", "120" } }),
        },
      }
    end,
  },
}
