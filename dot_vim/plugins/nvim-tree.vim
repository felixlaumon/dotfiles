lua << EOF
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    disable_netrw = false,
    hijack_netrw = false,
    view = {
        adaptive_size = true,
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
                { key = "-", action = "" },
            },
        },
    },
    renderer = {
        group_empty = true,
        icons = {
            show = {
                file = false,
                folder = false,
                git = false,
            }
        },
    },
    filters = {
        dotfiles = true,
    },
})
EOF

noremap - :NvimTreeToggle<CR>
