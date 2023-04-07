
-- Lualine
require('lualine').setup{
    options = { theme = 'nightfly' },
    sections = {
        lualine_c = {'g:coc_status'},
        lualine_x = {'encoding' , 'filetype'},
    },
}


require('nvim-tundra').setup({
    transparent_background = false,
    dim_inactive_windows = {
        enabled = false,
        color = nil,
    },
    sidebars = {
        enabled = true,
        color = nil,
    },
    editor = {
        search = {},
        substitute = {},
    },
    syntax = {
        booleans = { bold = true, italic = false },
        comments = { bold = true, italic = false },
        conditionals = {},
        constants = { bold = true },
        fields = {},
        functions = {},
        keywords = {},
        loops = {},
        numbers = { bold = true },
        operators = { bold = true },
        punctuation = {},
        strings = {},
        types = { italic = false },
    },
    diagnostics = {
        errors = {},
        warnings = {},
        information = {},
        hints = {},
    },
    plugins = {
        treesitter = true,
        telescope = true,
        nvimtree = true,
        gitsigns = true,
    },
})

-- TreeSitter
require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "c",
        "cpp",
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
        buffer_close_icon = '',
        modified_icon = '', -- 
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

require("toggleterm").setup{}
