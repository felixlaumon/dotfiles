return {
  {
    "numToStr/Navigator.nvim",
    init = function()
      require("Navigator").setup()
    end,
    keys = {
      { "<c-h>", "<cmd>NavigatorLeft<cr>", silent = true, desc = "Left pane" },
      { "<c-j>", "<cmd>NavigatorDown<cr>", silent = true, desc = "Down pane" },
      { "<c-k>", "<cmd>NavigatorUp<cr>", silent = true, desc = "Up pane" },
      { "<c-l>", "<cmd>NavigatorRight<cr>", silent = true, desc = "Right pane" },
    },
  },
}
