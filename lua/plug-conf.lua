
-- TreeSitter
require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "c",
        "lua",
        "java",
        "rust",
        "javascript",
        "python",
        "latex"
    },
    highlight = {
        enable = true,
    },
}

-- Nvim Tree
require("nvim-tree").setup{
    renderer = {
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
        exclude = {'.git', 'node_modules', '.cache'},
    },
    update_focused_file = { enable = true },
    hijack_directories = { enable = true },
    view = {
        hide_root_folder = true,
        mappings = {
            list = {
                { key='l'   , action = "edit" },
                { key='o'   , action = "edit" },
                { key='<cr>', action = "edit" },
                { key='I'   , action = "toggle_ignored" },
                { key='H'   , action = "toggle_dotfiles" },
                { key='R'   , action = "refresh" },
                { key='='   , action = "preview" },
                { key='X'   , action = "xdg_open", action_cb = xdg_open }
            }
        }
    },
    open_on_setup = false,
}

-- Git Signs
require('gitsigns').setup()

-- Bufferline
require("bufferline").setup{
    options = {
        buffer_close_icon = '',
        modified_icon = '', -- 
        close_icon = '',
        show_close_icon = true,
        left_trunc_marker = '',
        right_trunc_marker = '',
        color_icons = true,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer" ,
                text_align = "center",
                separator = false
            },
        },
    },
    highlights = {
    	buffer_selected = { italic = false },
    	diagnostic_selected = { italic = false },
    	hint_selected = { italic = false },
    	pick_selected = { italic = false },
    	pick_visible = { italic = false },
    	pick = { italic = false },
    },
}

-- Lualine
require('lualine').setup{
    options = { theme = 'nightfly' },
    sections = {
        lualine_c = {'lsp_progress'},
        lualine_x = {'encoding' ,'filetype'},
    },
}

--colorizerLua
require 'colorizer'.setup()


-- Telescope 
local actions = require("telescope.actions")
require 'telescope'.setup{
    defaults = {
        mappings = {
            i = {["<esc>"] = actions.close}
        }
    }
}
