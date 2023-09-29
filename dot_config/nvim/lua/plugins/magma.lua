return {
  {
    "dccsillag/magma-nvim",
    version = "*",
    build = ":UpdateRemotePlugins",
    opts = function ()
      vim.g.magma_image_provider = "kitty"
    end,
    keys = {
      {
        "<leader>mi",
        "<cmd>MagmaInit<CR>",
        desc = "This command initializes a runtime for the current buffer."
      },
      { "<leader>mo", "<cmd>MagmaEvaluateOperator<CR>", desc = "Evaluate text given by some operator" },
      { "<leader>ml", "<cmd>MagmaEvaluateLine<CR>",     desc = "Evaluate current line" },
      { "<leader>mv", "<cmd>MagmaEvaluateVisual<CR>",   desc = "Evaluate selected text",                mode = { "v" }, slient = true },
      { "<leader>mc", "<cmd>MagmaEvaluateOperator<CR>", desc = "Reevaluate the currently selected cell" },
      { "<leader>mr", "<cmd>MagmaRestart!<CR>",         desc = "Restarts the current kernel" },
      { "<leader>mx", "<cmd>MagmaInterrupt<CR>",        desc = "Interrupts the currently running cell" },
    },
  },
}
