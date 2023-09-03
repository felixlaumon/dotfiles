return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    flavour = "mocha",
    opts = {
      color_overrides = {
        mocha = {
          base = "#111111",
          mantle = "#111111",
          crust = "#111111",
        },
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
