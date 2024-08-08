-- https://github.com/LazyVim/LazyVim/pull/178/files
local BORDER_STYLE = "single"

return {
  -- lazyvim.plugins.coding
  {
    "nvim-cmp",
    opts = function(_, opts)
      local bordered = require("cmp.config.window").bordered
      return vim.tbl_deep_extend("force", opts, {
        window = {
          completion = bordered(BORDER_STYLE),
          documentation = bordered(BORDER_STYLE),
        },
      })
    end,
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    opts = function()
      local cmp = require("cmp")
      return {
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
      }
    end,
  },
  -- lazyvim.plugins.editor
  {
    "which-key.nvim",
    opts = { win = { border = BORDER_STYLE } },
  },
  {
    "gitsigns.nvim",
    opts = { preview_config = { border = BORDER_STYLE } },
  },
  -- lazyvim.plugins.lsp
  {
    "nvim-lspconfig",
    opts = function(_, opts)
      -- Set LspInfo border
      require("lspconfig.ui.windows").default_options.border = BORDER_STYLE
      return opts
    end,
  },
  {
    "mason.nvim",
    opts = {
      ui = { border = BORDER_STYLE },
    },
  },
  -- lazyvim.plugins.ui
  {
    "noice.nvim",
    opts = {
      presets = { lsp_doc_border = true },
    },
  },
}
