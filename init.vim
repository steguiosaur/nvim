" ============== NEOVIM CONFIG 230410 ===============

" ===================== OPTIONS =====================
set number " show numberline
set relativenumber " relative numberline
set expandtab " enables space for tabs
set tabstop=4 " number of spaces in a tab
set softtabstop=4 " spaces per <Tab> and <Backspace>
set autoindent " copy indent from previous line
set shiftwidth=4 " space for indentation
set hlsearch " highlight searched words
set incsearch " show search current matched patterns
set ignorecase " case insensitive search
set smartcase " override 'ignorecase'
set cursorline " highlight current cursor line
set showmatch " show matching parenthesis and brackets
set wrap " wrap lines extending the window
set breakindent " linebreak follows indentation
set breakat+=" ^!@*-+;:,./?" " linebreakable characters
set linebreak " break long lines in 'breakat'
set conceallevel=0 " reveal syntax on Markdown files
set fileencoding=utf8 " file encoding in buffer
set textwidth=0 " no string limitation
set shortmess+=c " shorten message prompts
set scrolloff=5 " lines above and below cursor
set mouse=a " mouse support
set laststatus=2 " last window statusline enable
set noshowmode " show current mode
set showtabline=1 " shows tabline
set signcolumn=yes " shows signcolumn
set modeline " file specific options on comments
set clipboard+=unnamedplus " connect to system clipboard
set confirm " confirm on exit
set wildmenu " command completion on <Tab>
set wildmode=longest,full " event on <Tab>
set wildignore=*.o,*.docx,*.pdf,*.jpg,*.png,*.gif,*.img
set termguicolors " enable 24-bit RGB color in the TUI
set hidden " hide current unsaved edited file on :e
set title " show filename and directory on titlestring
set undofile " persistent undo
set pumheight=10 " visible  
set noswapfile " swapfiles for recovery
set updatetime=250 " when nothing is typed

let g:python3_host_prog = '/usr/bin/python'
let g:python_host_prog  = '/usr/bin/python2'
" swapfiles
"set directory^=$HOME/.nvim/tmp//
" vertical help buffer
autocmd! BufEnter * if &ft ==# 'help' | wincmd L | endif")


" ===================== KEYMAPS =====================
let mapleader = " "
" line navigation on linebreak
nmap <S-j> gj
nmap <S-k> gk
" vertical and horizontal window
nmap <leader>v <C-w>v
nmap <leader>h <C-w>s
" window navigation
nmap <C-j> <C-W><C-J>
nmap <C-k> <C-W><C-K>
nmap <C-l> <C-W><C-L>
nmap <C-h> <C-W><C-H>
" window resize
nmap<silent> <C-Up> <cmd>resize +2<cr>
nmap<silent> <C-Down> <cmd>resize -2<cr>
nmap<silent> <C-Left> <cmd>vertical resize -2<cr>
nmap<silent> <C-Right> <cmd>vertical resize +2<cr>
" window vertical to horizontal (vice versa)
nmap <C-S-Up> <C-w><S-k>
nmap <C-S-Down> <C-w><S-j>
nmap <C-S-Left> <C-w><S-h>
nmap <C-S-Right> <C-w><S-l>

" buffer navigation
nmap<silent> <S-l> :bn<cr>
nmap<silent> <S-h> :bp<cr>
nmap<silent> <S-q> :bdelete<cr>
" save and quit
nmap<silent> <leader>q :q<cr>
nmap<silent> <leader>w :w<cr>
" change word 
nmap <leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
" chmod on nvim
nmap<silent> <leader>x <cmd>!chmod +x %<CR>
" move text up and down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
" fast Esc
imap jj <Esc>
" disable yank on paste
vmap p "_dP

" vimPlug
:command PC PlugClean       " Remove unused plugins
:command PI PlugInstall     " Install plugins
:command PU PlugUpdate      " Update plugins
:command FZ FZF             " FuzzyFinder
:command TT TagbarToggle    " TagBar
" remove highlight
nnoremap<silent> <esc><esc> :noh<return>
" file explorer
nmap<silent> <leader>e :NvimTreeToggle<cr>
" tagbar
nmap<silent> <leader>t :TagbarToggle<cr>
" Telescope.nvim
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fc <cmd>Telescope git_commits<cr>
nnoremap <leader>fs <cmd>Telescope git_status<cr>
" MarkdownPreview
nmap <leader>lm <Plug>MarkdownPreview
nmap <leader>ls <Plug>MarkdownPreviewStop
nmap <leader>lt <Plug>MarkdownPreviewToggle
" Coc nvim mappings
nmap <silent> gb <Plug>(coc-diagnostic-prev)
nmap <silent> gn <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use <Tab> and <S-Tab> for navigate completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" ===================== PLUGINS =====================
call plug#begin()
" Aesthetics
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'nvim-lualine/lualine.nvim'    " statusline
Plug 'sam4llis/nvim-tundra'         " colorscheme
Plug 'norcalli/nvim-colorizer.lua'  " colorHighlighter
" Functionalities
Plug 'goolord/alpha-nvim'           " start screen
Plug 'lukas-reineke/indent-blankline.nvim'  " indention
Plug 'jiangmiao/auto-pairs'         " autoParenthesis
Plug 'folke/which-key.nvim'         " keyCommands
Plug 'preservim/tagbar'             " browseTags
" File Explorer
Plug 'kyazdani42/nvim-web-devicons' " fileTreeIcons
Plug 'kyazdani42/nvim-tree.lua'     " fileTree
Plug 'nvim-lua/plenary.nvim'        " layout
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
" Completion Linters
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'puremourning/vimspector'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'lervag/vimtex'                " LaTeX
"Plug 'Exafunction/codeium.vim'      " AI completion
" Git
Plug 'tpope/vim-fugitive'           " gitCommands
Plug 'lewis6991/gitsigns.nvim'      " gutterDiff
call plug#end()

" =================== LUA CONFIG ====================
lua require("plugins")

" ================ PLUGINS SETTINGS =================
" colorscheme
syntax enable
colorscheme tundra

" tagbar
let g:tagbar_width = 30

" auto pairs
let g:AutoPairs = {'(':')', '[':']', '{':'}'}

" NvimTree
autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif

" LaTeX
let maplocalleader = " "    " <leader>ll LivePreview
let g:tex_flavor='latex'
let g:vimtex_syntax_conceal_disable = 1
let g:vimtex_quickfix_mode=1
let g:vimtex_view_method = 'zathura'

" coc.nvim
autocmd CursorHold * silent call CocActionAsync('highlight')

let g:coc_global_extensions = [
    \   'coc-clangd',
    \   'coc-cmake',
    \   'coc-css',
    \   'coc-diagnostic',
    \   'coc-docker',
    \   'coc-go',
    \   'coc-html',
    \   'coc-java',
    \   'coc-java-debug',
    \   'coc-json',
    \   'coc-ltex',
    \   'coc-markdownlint',
    \   'coc-phpls',
    \   'coc-pyright',
    \   'coc-rust-analyzer',
    \   'coc-sh',
    \   'coc-snippets',
    \   'coc-sql',
    \   'coc-tsserver',
    \   'coc-zig',
    \]

" MarkdownPreview
let g:mkdp_theme = 'dark'
