local M = {}

M._keys = nil

function M.get()
  local format = require("plugins.lsp.format").format
  M._keys = M._keys or {
    { "<leader>ld", vim.diagnostic.open_float, desc = "Line Diagnostics" },
    { "<leader>li", "<cmd>LspInfo<cr>", desc = "Lsp Info" },
    { "<leader>d", vim.lsp.buf.definition, desc = "Goto Definition" },
    { "<leader>D", vim.lsp.buf.declaration, desc = "Goto Declaration" },
    { "gr", vim.lsp.buf.references, desc = "References" },

    -- TODO: does not work without invoking Telescope first
    -- { "<leader>d", "<cmd>Telescope lsp_definitions<cr>", desc = "Goto Definition" },
    -- { "gr", "<cmd>Telescope lsp_references<cr>", desc = "References" },

    { "K", vim.lsp.buf.hover, desc = "Hover" },
    { "<c-k>", vim.lsp.buf.signature_help, mode = "i", desc = "Signature Help", has = "signatureHelp" },
    { "]g", M.diagnostic_goto(true), desc = "Next Diagnostic" },
    { "[g", M.diagnostic_goto(false), desc = "Prev Diagnostic" },
    { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" }, has = "codeAction" },
    { "<leader>f", format, desc = "Format Document", has = "documentFormatting" },
    { "<leader>f", format, desc = "Format Range", mode = "v", has = "documentRangeFormatting" },
    { "<leader>r", M.rename, expr = true, desc = "Rename", has = "rename" },
  }
  return M._keys
end

function M.on_attach(client, buffer)
  local Keys = require("lazy.core.handler.keys")
  local keymaps = {}

  for _, value in ipairs(M.get()) do
    local keys = Keys.parse(value)
    if keys[2] == vim.NIL or keys[2] == false then
      keymaps[keys.id] = nil
    else
      keymaps[keys.id] = keys
    end
  end

  for _, keys in pairs(keymaps) do
    if not keys.has or client.server_capabilities[keys.has .. "Provider"] then
      local opts = Keys.opts(keys)
      ---@diagnostic disable-next-line: no-unknown
      opts.has = nil
      opts.silent = true
      opts.buffer = buffer
      vim.keymap.set(keys.mode or "n", keys[1], keys[2], opts)
    end
  end
end

function M.rename()
  if pcall(require, "inc_rename") then
    return ":IncRename " .. vim.fn.expand("<cword>")
  else
    vim.lsp.buf.rename()
  end
end

function M.diagnostic_goto(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end

return M
