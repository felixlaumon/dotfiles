local Pick = require("lazyvim.util.pick")

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        config = function()
          require("telescope").load_extension("live_grep_args")
        end,
      },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
    },
    keys = {
      {
        "<c-p>",
        function()
          require("telescope.builtin").git_files({ show_untracked = true })
        end,
        desc = "Find Git Files",
      },
      {
        "<leader>/",
        vim.NIL,
      },
      {
        "<c-\\>",
        function()
          require("telescope").extensions.live_grep_args.live_grep_args()
        end,
        desc = "Live Grep",
      },
      -- {
      --   "<c-s-|>",
      --   function()
      --     local lga_actions = require("telescope-live-grep-args.actions")
      --     lga_actions.quote_prompt({ postfix = " --iglob " })
      --   end,
      --   desc = "Live Grep with iglob",
      -- },
      {
        "<leader>.",
        function()
          Pick.open("lsp_dynamic_workspace_symbols", {
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
          })
        end,
        desc = "Goto Symbol (Workspace)",
      },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "bottom",
            preview_width = 0.4,
          },
          width = 0.95,
          height = 0.95,
          preview_cutoff = 120,
        },
      },
      live_grep_args = {
        auto_quoting = true
      }
    },
  },
}
