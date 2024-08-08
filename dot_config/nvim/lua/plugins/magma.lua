return {
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>m", group = "molten" },
      }
    },
  },

  {
    "benlubas/molten-nvim",
    enabled = false,
    version = "^1.0.0",
    build = ":UpdateRemotePlugins",
    dependencies = {
      {
        "3rd/image.nvim",
        config = {
          backend = "kitty",
          max_width = 100,
          max_height = 12,
          max_height_window_percentage = math.huge,
          max_width_window_percentage = math.huge,
          window_overlap_clear_enabled = true,
          window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
        },
      },
      {
        "edluffy/hologram.nvim",
        config = true,
      },
    },
    init = function()
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_output_win_max_height = 20
    end,
    keys = {
      {
        "<leader>mi",
        "<cmd>MoltenInit<CR>",
        desc = "This command initializes a runtime for the current buffer.",
      },
      { "<leader>mo", "<cmd>MoltenEvaluateOperator<CR>", desc = "Evaluate text given by some operator" },
      { "<leader>ml", "<cmd>MoltenEvaluateLine<CR>", desc = "Evaluate current line" },
      {
        "<leader>mv",
        "<cmd>MoltenEvaluateVisual<CR>",
        desc = "Evaluate selected text",
        mode = { "v" },
        -- slient = true,
      },
      { "<leader>mc", "<cmd>MoltenEvaluateOperator<CR>", desc = "Reevaluate the currently selected cell" },
      { "<leader>mr", "<cmd>MoltenRestart!<CR>", desc = "Restarts the current kernel" },
      { "<leader>mx", "<cmd>MoltenInterrupt<CR>", desc = "Interrupts the currently running cell" },
    },
  },
}
