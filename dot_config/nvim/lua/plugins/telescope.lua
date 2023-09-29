local Util = require("lazyvim.util")

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
      },
    },
    config = function()
      require("telescope").load_extension("live_grep_args")
    end,
    keys = {
      {
        "<c-\\>",
        function() require("telescope").extensions.live_grep_args.live_grep_args() end,
        desc = "Live Ripgrep"
      },
      {
        "<c-p>",
        "<cmd>Telescope find_files<cr>",
        desc = "Find files"
      },
      {
        "<leader>/",
        vim.NIL
      },
      {
        "<leader>.",
        Util.telescope("lsp_dynamic_workspace_symbols", {
          symbols = {
            "Class",
            "Function",
            "Method",
            "Constructor",
            "Interface",
            "Module",
            "Struct",
            "Trait",
            "Field",
            "Property",
          },
        }),
        desc = "Goto Symbol (Workspace)",
      },
    },
  },
}
