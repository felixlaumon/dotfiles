return {
  {
    "folke/tokyonight.nvim",
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    flavour = "mocha",
    opts = {
      integrations = {
        alpha = true,
        cmp = true,
        gitsigns = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        lsp_trouble = true,
        mason = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        noice = true,
        notify = true,
        neotree = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        which_key = true,
      },
      color_overrides = {
        mocha = {
          base = "#111111",
          mantle = "#111111",
          crust = "#111111",
        },
      },
    },
  },
}
