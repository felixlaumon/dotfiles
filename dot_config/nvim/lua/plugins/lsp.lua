return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v1.x',

  dependencies = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'saadparwaiz1/cmp_luasnip'},
    {'hrsh7th/cmp-nvim-lua'},
    {"folke/neodev.nvim"},

    -- Snippets
    {'L3MON4D3/LuaSnip'},
    {'rafamadriz/friendly-snippets'},
  },

  opts = function ()
    local lsp = require("lsp-zero")

    lsp.preset("recommended")

    lsp.set_preferences({
      set_lsp_keymaps = false,
    })

    lsp.ensure_installed({
      'tsserver',
      'sumneko_lua',
      'pyright',
    })

    lsp.nvim_workspace()

    vim.diagnostic.config({
      virtual_text = true
    })

    lsp.setup()
  end,

  keys = {
    { "K", vim.lsp.buf.hover },
    { "<leader>d", vim.lsp.buf.definition },
    { "<leader>gr", vim.lsp.buf.references },
    { "<leader>rn", vim.lsp.buf.rename },
    { "[g", vim.diagnostic.goto_prev },
    { "]g", vim.diagnostic.goto_next },
  },
}
