local Util = require("lazyvim.util")

return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<c-\\>", Util.telescope("live_grep"), desc = "Live grep" },
      { "<c-p>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    },
  },
}
