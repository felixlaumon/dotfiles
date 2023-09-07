return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    flavour = "mocha",
    opts = function()
      return {
        color_overrides = {
          mocha = {
            base = "#111111",
            mantle = "#111111",
            crust = "#111111",
          },
        },
        custom_highlights = function(colors)
          return {
            VertSplit = { fg = colors.surface2 },
          }
        end,
      }
    end,
  },

  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night",
      on_colors = function(colors)
        local black = "#111111"
        local true_black = "#000000"
        local true_white = "#ffffff"
        colors.bg = true_black
        colors.border = true_white
        colors.bg_dark = true_black
        colors.bg_float = true_black
        colors.bg_popup = true_black
        colors.bg_sidebar = black
        colors.bg_statusline = black
      end
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
