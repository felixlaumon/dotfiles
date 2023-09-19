return {
  {
    "stevearc/aerial.nvim",
    opts = {
      attach_mode = "global",
      layout = { min_width = 28 },
      show_guides = true,
      keymaps = {
        ["[y"] = false,
        ["]y"] = false,
        ["[Y"] = false,
        ["]Y"] = false,
        ["{"] = false,
        ["}"] = false,
        ["[["] = false,
        ["]]"] = false,
      },
    },
    keys = {
      { "<leader>t", function() require("aerial").toggle() end, silent = true, desc = "Toggle Aerial" },
    },
  },
}
