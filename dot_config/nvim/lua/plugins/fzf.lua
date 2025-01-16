return {
  "ibhagwan/fzf-lua",
  keys = {
    { "<c-p>", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
    -- { "<leader>/", vim.NIL },
    { "<c-\\>", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
  },
}
