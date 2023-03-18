local Util = require "config.util"

return {
  {
    "RRethy/nvim-base16",
    lazy = false,
    priority = 1000,
  },

  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals" } },
    keys = {
      { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
      { "<leader>ql", function() require("persistence").load { last = true } end, desc = "Restore Last Session" },
      { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
  },

  {
    "numToStr/Comment.nvim",
    opts = {
      mappings = {
        basic = true,
      },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false,
    keys = function()
      -- local actions = require("telescope.actions")
      return {
        { "<c-p>", Util.telescope "files", desc = "Find files" },
        { "<leader>b", "<cmd>Telescope buffers<cr>", desc = "Find files" },
        { "<leader>w", Util.telescope "grep_string", desc = "Find current word" },
        { "<c-\\>", Util.telescope "live_grep", desc = "Live grep" },
        { "<c-g>", Util.telescope "resume", desc = "Resume last search" },
        -- { "<esc>", actions.close },
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
          desc = "Goto Symbol",
        },
      }
    end,
    opts = {
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
      },
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    branch = "v2.x",

    dependencies = {
      { "nvim-tree/nvim-web-devicons", lazy = true },
      { "MunifTanjim/nui.nvim", lazy = true },
    },

    keys = {
      {
        "-",
        function() require("neo-tree.command").execute { toggle = true, dir = vim.loop.cwd() } end,
        desc = "Explorer NeoTree (cwd)",
      },
    },

    init = function()
      vim.g.neo_tree_remove_legacy_commands = 1
      if vim.fn.argc() == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then require "neo-tree" end
      end
    end,

    opts = {
      default_component_configs = {
        indent = {
          padding = 0,
        },
        name = {
          use_git_status_colors = true,
        },
        git_status = {
          symbols = {
            added = "",
            modified = "",
            deleted = "",
          },
        },
      },
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = true,
        hide_dotfiles = false,
      },
      window = {
        width = 30,
        mappings = {
          ["<space>"] = "none",
          ["v"] = "open_vsplit",
          ["h"] = "open_split",
        },
      },
    },
  },

  {
    "christoomey/vim-tmux-navigator",
    keys = {
      { "<c-h>", "<cmd>TmuxNavigateLeft<cr>", silent = true, desc = "Left pane" },
      { "<c-j>", "<cmd>TmuxNavigateDown<cr>", silent = true, desc = "Down pane" },
      { "<c-k>", "<cmd>TmuxNavigateUp<cr>", silent = true, desc = "Up pane" },
      { "<c-l>", "<cmd>TmuxNavigateRight<cr>", silent = true, desc = "Right pane" },
    },
    init = function() vim.g.tmux_navigator_no_mappings = 1 end,
  },

  {
    "kevinhwang91/nvim-ufo",
    lazy = true,

    dependencies = {
      { "kevinhwang91/promise-async", lazy = true },
    },

    init = function()
      vim.o.foldcolumn = "0"
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }
      local language_servers = require("lspconfig").util.available_servers()
      for _, ls in ipairs(language_servers) do
        require("lspconfig")[ls].setup {
          capabilities = capabilities,
        }
      end
      require("ufo").setup()
    end,

    keys = {
      { "zO", function() require("ufo").openAllFolds() end, desc = "Open all folds" },
      { "zC", function() require("ufo").closeAllFolds() end, desc = "Close all folds" },
    },
  },

  {
    "stevearc/aerial.nvim",
    opts = {
      attach_mode = "global",
      backends = { "lsp", "treesitter", "markdown", "man" },
      layout = { min_width = 28 },
      show_guides = true,
      filter_kind = false,
      guides = {
        mid_item = "├ ",
        last_item = "└ ",
        nested_top = "│ ",
        whitespace = "  ",
      },
      keymaps = {
        ["[y"] = "actions.prev",
        ["]y"] = "actions.next",
        ["[Y"] = "actions.prev_up",
        ["]Y"] = "actions.next_up",
        ["{"] = false,
        ["}"] = false,
        ["[["] = false,
        ["]]"] = false,
      },
    },
    keys = {
      { "<leader>t", function() require("aerial").toggle() end, silent = true, desc = "Toggle Aerial" },
    },
  },
}
