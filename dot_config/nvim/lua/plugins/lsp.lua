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
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["python"] = { "ruff_format", "ruff_organize_imports" },
      },
      formatters = {
        black = {
          prepend_args = {
            "--line-length",
            "120",
          },
        },
      },
    },
  },
  {
    "zeioth/garbage-day.nvim",
    dependencies = "neovim/nvim-lspconfig",
    event = "VeryLazy",
    opts = {
      grace_period = 60 * 10,
      wakeup_delay = 500,
    },
  },
  {
    "saghen/blink.cmp",
    opts = {
      trigger = {
        signature_help = {
          enabled = true,
        },
      },
    },
  },
  -- {
  --   "neovim/nvim-lspconfig",
  --   init = function()
  --     local keys = require("lazyvim.plugins.lsp.keymaps").get()
  --     keys[#keys + 1] = { "<leader>cli", "<cmd>LspInfo<cr>", desc = "LspInfo" }
  --     keys[#keys + 1] = { "<leader>cll", vim.lsp.codelens.run, desc = "Run Code Lens" }
  --     keys[#keys + 1] = { "<leader>cld", vim.lsp.codelens.refresh, desc = "Refresh Code Lens" }
  --     keys[#keys + 1] = { "<leader>clr", "<cmd>LspRestart<cr>", desc = "Restart Lsp" }
  --   end,
  --   opts = {
  --     diagnostics = {
  --       virtual_text = { severity = vim.diagnostic.severity.ERROR },
  --     },
  --     inlay_hints = {
  --       enabled = false,
  --     },
  --     codelens = {
  --       enabled = false,
  --     },
  --   },
  -- },
}
