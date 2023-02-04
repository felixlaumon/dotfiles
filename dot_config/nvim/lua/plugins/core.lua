return {
  { "chriskempson/base16-vim" },

  { "numToStr/Comment.nvim",
    opts = {
      mappings = {
        basic = true
      }
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
    },
    keys = {
      { "<c-p>", "<cmd>Telescope find_files<cr>", desc = "Find files"},
      { "<leader>f", "<cmd>Telescope git_files<cr>", desc = "Find git files"},
      { "<leader>w", "<cmd>Telescope grep_string<cr>", desc = "Find current word"},
      { "<c-\\>", "<cmd>Telescope live_grep<cr>", desc = "Live grep"},
      -- TODO resume?
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    branch = "v2.x",

    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
      { "nvim-tree/nvim-web-devicons", lazy = true },
      { "MunifTanjim/nui.nvim", lazy = true },
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

    init = function()
      vim.g.neo_tree_remove_legacy_commands = 1
      if vim.fn.argc() == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          require("neo-tree")
        end
      end
    end,

    opts = {
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = true,
      },
      window = {
        mappings = {
          ["<space>"] = "none",
        },
      },
    },
  },

  {
    "christoomey/vim-tmux-navigator",
    keys = {
      { "<c-h>", "<cmd>TmuxNavigateLeft<cr>", silent = true },
      { "<c-j>", "<cmd>TmuxNavigateDown<cr>", silent = true },
      { "<c-k>", "<cmd>TmuxNavigateUp<cr>", silent = true },
      { "<c-l>", "<cmd>TmuxNavigateRight<cr>", silent = true },
    },
    init = function ()
        vim.g.tmux_navigator_no_mappings = 1
    end,
  },

  {
    "kevinhwang91/nvim-ufo",

    dependencies = {
      { "kevinhwang91/promise-async", lazy = true },
    },

    init = function ()
      vim.o.foldcolumn = '0'
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingRange = {
          dynamicRegistration = false,
          lineFoldingOnly = true
      }
      local language_servers = require("lspconfig").util.available_servers()
      for _, ls in ipairs(language_servers) do
          require('lspconfig')[ls].setup({
              capabilities = capabilities
          })
      end
      require('ufo').setup()
    end,

    keys = {
      { "zO", function () require('ufo').openAllFolds() end },
      { "zC", function () require('ufo').closeAllFolds() end },
    }
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      show_current_context = true,
    }
  }
}
