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

  -- {
  --   "hrsh7th/cmp-nvim-lsp",
  --   opts = function()
  --     local cmp = require("cmp")
  --     return {
  --       window = {
  --         completion = cmp.config.window.bordered(),
  --         documentation = cmp.config.window.bordered(),
  --       },
  --     }
  --   end,
  -- },

  {
    "jose-elias-alvarez/null-ls.nvim",
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
