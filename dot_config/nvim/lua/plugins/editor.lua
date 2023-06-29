return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",
    opts = {
      highlight = { enable = true },
      indent = {
        enable = true,
        disable = { "python" },
      },
      context_commentstring = { enable = true, enable_autocmd = false },
      ensure_installed = {
        "bash",
        "help",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
    config = function(_, opts) require("nvim-treesitter.configs").setup(opts) end,
  },

  {
    "windwp/nvim-spectre",
    keys = {
      { "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    opts = function()
      local icons = require "config.icons"
      local opt = {
        signs = {
          add = { text = icons.git.added },
          change = { text = icons.git.modified },
          delete = { text = icons.git.removed },
          topdelete = { text = icons.git.removed },
          changedelete = { text = icons.git.removed },
          untracked = { text = icons.git.added },
        },
        on_attach = function(buffer)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, desc) vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc }) end

          map("n", "<leader>gb", function() gs.blame_line { full = false } end, "Blame Line")
        end,
      }
      return opt
    end,
  },

  {
    "sindrets/diffview.nvim",
    -- TODO: doesn't work with lazy
    -- lazy = true,
    cmds = { "DiffviewOpen", "DiffviewFileHistory" },
    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
    },
  },

  {
    "echasnovski/mini.bufremove",
    lazy = true,
    keys = {
      { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
    },
  },

  { "echasnovski/mini.pairs", lazy = true },
  { "echasnovski/mini.surround", lazy = true },

  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    opts = { use_diagnostic_signs = true },
    keys = {
      { "<leader>x", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
      -- TODO: does not work
      { "<leader>X", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
    },
  },

  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = "BufReadPost",
    config = true,
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
      { "<leader>T", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
    },
  },

  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    config = function(_, opts) require("mini.pairs").setup(opts) end,
  },

  { "ConradIrwin/vim-bracketed-paste", lazy = true },

  { "NMAC427/guess-indent.nvim", config = true },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function() require("flash").jump() end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function() require("flash").treesitter() end,
        desc = "Flash Treesitter",
      },
    },
  },

  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    opts = { delay = 100, filetypes_denylist = { "telescope", "trouble" } },
    config = function(_, opts)
      require("illuminate").configure(opts)
      local function map(key, dir, buffer)
        vim.keymap.set(
          "n",
          key,
          function() require("illuminate")["goto_" .. dir .. "_reference"](true) end,
          { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer }
        )
      end

      map("]]", "next")
      map("[[", "prev")

      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          local buffer = vim.api.nvim_get_current_buf()
          map("]]", "next", buffer)
          map("[[", "prev", buffer)
        end,
      })
    end,
    keys = {
      { "]]", desc = "Next Reference" },
      { "[[", desc = "Prev Reference" },
    },
  },
}
