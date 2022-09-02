" NEOVIM CONFIG 220829

""" ------ Main Configurations ------
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch
set wildmode=longest,list,full wildmenu
set ruler laststatus=2 showcmd showmode
set wrap breakindent linebreak
filetype plugin indent on
set number relativenumber
set clipboard=unnamedplus
set termguicolors      " about colors of something
set encoding=utf8      " output encoding
set shortmess+=c       " Hide or shorten certain messages
set textwidth=0        " adjust width max 80 char
set showmatch          " show matching
set modeline           " enable vim modelines
set confirm            " confirm save before quit.
set hidden             " related to buffers
set title

let g:python3_host_prog = '$HOME/../usr/bin/python3'
let g:python_host_prog  = '$HOME/../usr/bin/python2'


""" ------ Command Shortcuts ------
:command FZ FZF
:command PC PlugClean
:command PI PlugInstall
:command PU PlugUpdate
:command TT TagbarToggle


""" ------ Additional Mappings ------
" change windows with ctrl+(hjkl)
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" buffer mappings
map bn :bn<cr>
map bp :bp<cr>
map bd :bdelete<cr>
" remove highlight
nnoremap<silent> <esc><esc> :noh<return>
"etc mappings
nmap<silent> f :Fern . -stay -drawer -toggle -width=25<cr>

""" ------ Plugins ------
call plug#begin()
" Aesthetics
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'nvim-lualine/lualine.nvim'  " something
Plug 'ryanoasis/vim-devicons'     " icons
Plug 'Yggdroot/indentLine'        " line indent
Plug 'mhinz/vim-startify'         " startify
Plug 'lambdalisue/fern-renderer-devicons.vim'
Plug 'EdenEast/nightfox.nvim'     " colorscheme
" Functionalities
Plug 'preservim/tagbar'           " browse tags
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'           " Fuzzyfinder
Plug 'jiangmiao/auto-pairs'       " auto parenthesis
Plug 'lambdalisue/fern.vim'       " file explorer
" Completion, linters
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex'              " LaTeX
" Git
Plug 'tpope/vim-fugitive'         " git commands
Plug 'airblade/vim-gitgutter'     " git diff
call plug#end()


""" ------ Plugin Settings ------
" Fern
let g:fern#renderer = "devicons"
let g:fern_renderer_devicons_disable_warning = 1

" bufferline + line
lua << END
require("bufferline").setup{}
require('lualine').setup()
END

" colorscheme
syntax enable
colorscheme nightfox

" tagbar
let g:tagbar_width = 20

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
    \   'coc-docker',
    \   'coc-html',
    \   'coc-java',
    \   'coc-json',
    \   'coc-markdownlint',
    \   'coc-phpls',
    \   'coc-pyright',
    \   'coc-rls',
    \   'coc-sh',
    \   'coc-sql',
    \   'coc-tsserver',
    \   'coc-word',
    \   'coc-xml',
    \   'coc-zig',
    \]

" startify
function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction
let g:startify_files_number = 5
let g:ascii = [
            \' ',
            \'▒█▄░▒█ ▒█▀▀▀ ▒█▀▀▀█ ▒█░░▒█ ▀█▀ ▒█▀▄▀█',
            \'▒█▒█▒█ ▒█▀▀▀ ▒█░░▒█ ░▒█▒█░ ▒█░ ▒█▒█▒█',
            \'▒█░░▀█ ▒█▄▄▄ ▒█▄▄▄█ ░░▀▄▀░ ▄█▄ ▒█░░▒█',
            \' ',
            \]
let g:startify_custom_header =
          \ 'startify#center(g:ascii) + startify#center(startify#fortune#boxed())'
