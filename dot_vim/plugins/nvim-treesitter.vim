lua << EOF
require'nvim-treesitter.configs'.setup {
    sync_install = false,
    auto_install = true,
    ignore_install = { "python" },
    highlight = {
        disable = { "python" },
    },
}
EOF
