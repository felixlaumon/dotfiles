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
    "saghen/blink.cmp",
    opts = {
      signature = {
        enabled = true,
      },
      sources = {
        providers = {
          path = {
            opts = {
              show_hidden_files_by_default = true
            }
          }
        }
      }
    },
  },
}
