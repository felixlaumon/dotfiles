return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        width = 30,
        mappings = {
          ["v"] = "open_vsplit",
          ["h"] = "open_split",
        },
      },
    },
    keys = {
      {
        "-",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
    },
  },
}
