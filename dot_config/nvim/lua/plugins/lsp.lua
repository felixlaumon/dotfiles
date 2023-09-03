return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "isort",
        "pyright",
        "ruff",
        "shellcheck",
        "shfmt",
        "stylua",
        "svelte-language-server",
      },
    },
  },
}
