--local opts = { noremap = true, silent = true }
--local keymap = vim.api.nvim_set_keymap
--
--local function on_attach(bufnr)
--    local api = require("nvim-tree.api")
--
--    local function opts(desc)
--        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, nowait = true }
--    end
--
--    keymap('n', '<CR>', api.node.open.edit, opts('Open'))
--    keymap('n', 'I', api.tree.toggle_gitignore_filter, opts('Toggle Git Ignore'))
--    keymap('n', 'H', api.tree.toggle_hidden_filter, opts('Toggle Dotfiles'))
--    keymap('n', 'r', api.fs.rename, opts('Rename'))
--    keymap('n', 'R', api.tree.reload, opts('Refresh'))
--    keymap('n', 'U', api.tree.toggle_custom_filter, opts('Toggle Hidden'))
--    keymap('n', 'S', api.tree.search_node, opts('Search'))
--end

require("nvim-tree").setup {
    renderer = {
        root_folder_label = false,
        indent_markers = {
            enable = true,
        },
        icons = {
            glyphs = {
                default = '',
                symlink = '',
            },
            show = {
                git = true,
                folder = true,
                file = true,
                folder_arrow = true,
            }
        }
    },
    actions = {
        open_file = {
            window_picker = {
                exclude = {
                    filetype = {
                        "vim-plug",
                        "qf"
                    },
                    buftype = {
                        "terminal",
                        "help"
                    }
                },
            },
        },
    },
    filters = {
        exclude = { '.git', 'node_modules', '.cache' },
    },
    update_focused_file = { enable = true },
    hijack_directories = { enable = true },
    on_attach = on_attach,
}
