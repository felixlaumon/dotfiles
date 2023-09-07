return {
  {
    "folke/noice.nvim",
    -- Disable search virtual text
    opts = {
      routes = {
        {
          filter = {
            event = "msg_show",
            kind = "search_count",
          },
          opts = { skip = true },
        },
      },
    },
  },
}
