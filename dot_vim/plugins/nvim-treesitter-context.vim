lua << EOF
require'treesitter-context'.setup{
    enable = true,
    max_lines = 0,
    trim_scope = 'outer',
    patterns = {
        default = {
            'class',
            'function',
            'method',
            'for',
            'while',
            'if',
            'switch',
            'case',
        },
        tex = {
            'chapter',
            'section',
            'subsection',
            'subsubsection',
        },
        markdown = {
            'section',
        },
        json = {
            'pair',
        },
        yaml = {
            'block_mapping_pair',
        },
    },
    zindex = 20,
    mode = 'topline',
}
EOF
