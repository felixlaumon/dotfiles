local Util = require("lazyvim.util")

return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<c-\\>", Util.telescope("live_grep"), desc = "Live grep" },
      { "<c-p>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>/", vim.NIL },
      {
        "<leader>.",
        Util.telescope("lsp_document_symbols", {
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
        desc = "Goto Symbol",
      },
    },
  },
}
