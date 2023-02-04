-- return {
--   {
--     'VonHeikemen/lsp-zero.nvim',
--     branch = 'v1.x',
--
--     dependencies = {
--       -- LSP Support
--       {'neovim/nvim-lspconfig'},
--       {'williamboman/mason.nvim'},
--       {'williamboman/mason-lspconfig.nvim'},
--
--       -- Autocompletion
--       {'hrsh7th/nvim-cmp'},
--       {'hrsh7th/cmp-nvim-lsp'},
--       {'hrsh7th/cmp-buffer'},
--       {'hrsh7th/cmp-path'},
--       {'saadparwaiz1/cmp_luasnip'},
--       {'hrsh7th/cmp-nvim-lua'},
--       {"folke/neodev.nvim"},
--
--       -- Snippets
--       {'L3MON4D3/LuaSnip'},
--       {'rafamadriz/friendly-snippets'},
--     },
--
--     opts = function ()
--       local lsp = require("lsp-zero")
--
--       lsp.preset("recommended")
--
--       lsp.set_preferences({
--         set_lsp_keymaps = false,
--       })
--
--       lsp.ensure_installed({
--         'tsserver',
--         'sumneko_lua',
--         'pyright',
--       })
--
--       lsp.nvim_workspace()
--
--       vim.diagnostic.config({
--         -- TODO virtual text does not work
--         virtual_text = { spacing = 4, prefix = "●" },
--       })
--
--       lsp.setup()
--     end,
--
--     keys = {
--       { "K", vim.lsp.buf.hover },
--       { "<leader>d", vim.lsp.buf.definition },
--       { "<leader>gr", vim.lsp.buf.references },
--       { "<leader>rn", vim.lsp.buf.rename },
--       { "[g", vim.diagnostic.goto_prev },
--       { "]g", vim.diagnostic.goto_next },
--     },
--
--   },
--
--   -- TODO does not actually illuminate but just underline
--   {
--     "RRethy/vim-illuminate",
--     event = "BufReadPost",
--     opts = {
--       large_file_cutoff = 5000,
--       min_count_to_highlight = 2,
--     },
--     config = function(_, opts)
--       require("illuminate").configure(opts)
--     end,
--   },
--
--   { "folke/neodev.nvim" },
-- }

-- TODO autocomplete does not pop up...
return {
  {
    "hrsh7th/nvim-cmp",
    version = false,
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
    },
    opts = function()
      local cmp = require("cmp")
      return {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
        formatting = {
          format = function(_, item)
            local icons = require("config.icons").kinds
            if icons[item.kind] then
              item.kind = icons[item.kind] .. item.kind
            end
            return item
          end,
        },
        experimental = {
          ghost_text = {
            hl_group = "LspCodeLens",
          },
        },
      }
    end,
  },

  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",

    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      { "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
      { "mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },

      -- Autocompletion
      {
        "hrsh7th/cmp-nvim-lsp",
        cond = function()
          return require("config.util").has("nvim-cmp")
        end,
      },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    },

    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
      },
      autoformat = false,
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
      servers = {
      },
      setup = {
        ["*"] = function (_, _) end,
      },
    },

    config = function(_, opts)
      require("config.util").on_attach(function(client, buffer)
        require("plugins.lsp.keymaps").on_attach(client, buffer)
      end)

      -- diagnostics
      for name, icon in pairs(require("config.icons").diagnostics) do
        name = "DiagnosticSign" .. name
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
      end
      vim.diagnostic.config(opts.diagnostics)

      local servers = opts.servers
      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

      local function setup(server)
        local server_opts = servers[server] or {}
        server_opts.capabilities = capabilities
        if opts.setup[server] then
          if opts.setup[server](server, server_opts) then
            return
          end
        elseif opts.setup["*"] then
          if opts.setup["*"](server, server_opts) then
            return
          end
        end
        require("lspconfig")[server].setup(server_opts)
      end

      local mlsp = require("mason-lspconfig")
      local available = mlsp.get_available_servers()

      local ensure_installed = {}
      for server, server_opts in pairs(servers) do
        if server_opts then
          server_opts = server_opts == true and {} or server_opts
          -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
          if server_opts.mason == false or not vim.tbl_contains(available, server) then
            setup(server)
          else
            ensure_installed[#ensure_installed + 1] = server
          end
        end
      end

      require("mason-lspconfig").setup({ ensure_installed = ensure_installed })
      require("mason-lspconfig").setup_handlers({ setup })
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        sources = {
          nls.builtins.formatting.stylua,
          nls.builtins.diagnostics.flake8,
        },
      }
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "pyright",
        "lua-language-server"
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      for _, tool in ipairs(opts.ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end,
  },
}