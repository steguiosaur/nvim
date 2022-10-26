" NEOVIM CONFIG 220927

" ------ OPTIONS ------
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch
set wildmode=longest,list,full wildmenu
set ruler laststatus=2 showcmd showmode
set wrap breakindent linebreak
filetype plugin indent on
set number relativenumber
set clipboard+=unnamedplus
set termguicolors       " about colors of something
set encoding=utf8       " output encoding
set shortmess+=c        " Hide or shorten certain messages
set textwidth=0         " adjust width max 80 char
set scrolloff=2
set showmatch           " show matching
set modeline            " enable vim modelines
set confirm             " confirm save before quit.
set hidden              " related to buffers
set title

let g:python3_host_prog = '$PREFIX/bin/python3'
let g:python_host_prog  = '$PREFIX/bin/python2'


" ------ KEYMAPS ------
let mapleader = " "
" vimPlug
:command PC PlugClean
:command PI PlugInstall
:command PU PlugUpdate
:command FZ FZF
:command TT TagbarToggle
" change windows with ctrl+(hjkl)
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>
" buffer mappings
map <S-l> :bn<cr>
map <S-h> :bp<cr>
map <S-x> :bdelete<cr>
nmap<silent> <leader>q :q<cr>
" remove highlight
nnoremap<silent> <esc><esc> :noh<return>
" file explorer
nmap<silent> <leader>e :NvimTreeToggle<cr>
" Telescope.nvim
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


" ------ PLUGINS ------
call plug#begin()
" Aesthetics
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'nvim-lualine/lualine.nvim'    " statusline
Plug 'ryanoasis/vim-devicons'       " icons
Plug 'sam4llis/nvim-tundra'         " colorscheme
Plug 'norcalli/nvim-colorizer.lua'  " colorHighlighter
" Functionalities
Plug 'mhinz/vim-startify'           " startPrompt
Plug 'Yggdroot/indentLine'          " indention
Plug 'jiangmiao/auto-pairs'         " autoParenthesis
Plug 'folke/which-key.nvim'         " keyCommands
Plug 'preservim/tagbar'             " browseTags
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
" File Explorer
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'             " fuzzyFinder
Plug 'kyazdani42/nvim-web-devicons' " fileTreeIcons
Plug 'kyazdani42/nvim-tree.lua'     " fileTree
Plug 'nvim-lua/plenary.nvim'        " layout
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
" Completion Linters
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'arkav/lualine-lsp-progress'
" Git
Plug 'tpope/vim-fugitive'           " gitCommands
Plug 'lewis6991/gitsigns.nvim'      " gutterDiff
call plug#end()


" ------ PLUGIN SETTINGS ------

" colorscheme
syntax enable
colorscheme tundra

" indentLine
let g:indentLine_char = '▏'

" tagbar
let g:tagbar_width = 20

" auto pairs
let g:AutoPairs = {'(':')', '[':']', '{':'}'}

" coc.nvim
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set signcolumn=yes
autocmd CursorHold * silent call CocActionAsync('highlight')
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

let g:coc_global_extensions = [
    \   'coc-clangd',
    \   'coc-cmake',
    \   'coc-css',
    \   'coc-diagnostic',
    \   'coc-docker',
    \   'coc-html',
    \   'coc-java',
    \   'coc-java-debug',
    \   'coc-json',
    \   'coc-markdownlint',
    \   'coc-phpls',
    \   'coc-pyright',
    \   'coc-rust-analyzer',
    \   'coc-sh',
    \   'coc-sql',
    \   'coc-tsserver',
    \   'coc-xml',
    \   'coc-yaml',
    \   'coc-zig',
    \]

" startify
function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction
let g:startify_files_number = 5
let g:ascii = [
            \' ',
            \'        ▒█▄░▒█ ▒█▀▀▀ ▒█▀▀▀█ ▒█░░▒█ ▀█▀ ▒█▀▄▀█',
            \'        ▒█▒█▒█ ▒█▀▀▀ ▒█░░▒█ ░▒█▒█░ ▒█░ ▒█▒█▒█',
            \'        ▒█░░▀█ ▒█▄▄▄ ▒█▄▄▄█ ░░▀▄▀░ ▄█▄ ▒█░░▒█',
            \' ',
            \]
let g:startify_custom_header =
            \ 'startify#pad(g:ascii + startify#fortune#boxed())'

" LUA CONFIG
lua << EOF

-- TreeSitter
require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "java", "rust", "javascript"},
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
        buffer_close_icon = '',
        modified_icon = '•', -- 
        close_icon = '',
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
    sections = {
        lualine_c = {'lsp_progress'},
        lualine_x = {'encoding' ,'filetype'},
    },
}

--colorizerLua
require 'colorizer'.setup()

EOF

autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif

