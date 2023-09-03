return {
  {
    "echasnovski/mini.bufremove",
    keys = {
      {
        "<C-w>",
        function()
          require("mini.bufremove").delete(0, false)
        end,
        desc = "Delete Buffer",
      },
    },
  },
}
