" NEOVIM CONFIG 221805

""" ------ Main Configurations ------
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch
set wildmode=longest,list,full wildmenu
set ruler laststatus=2 showcmd showmode
filetype plugin indent on
set number relativenumber
set clipboard=unnamedplus
set wrap breakindent
filetype plugin on     " detect type of file
set encoding=utf8      " output encoding
set shortmess+=c       " Hide or shorten certain messages
set textwidth=0        " adjust width max 80 char
set showmatch          " show matching
set modeline           " enable vim modelines
set confirm            " confirmation save before quit.
set hidden             " related to buffers
syntax on              " syntax highlighting
set title

let g:python3_host_prog = '/data/data/com.termux/files/usr/bin/python3'
let g:python_host_prog  = '/data/data/com.termux/files/usr/bin/python2'

" ------ Command Shortcuts ------
:command EX Explore
:command FZ FZF
:command NT NERDTree
:command PC PlugClean
:command PI PlugInstall
:command PU PlugUpdate
:command TM terminal

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
nnoremap <esc><esc> :noh<return>


""" ------ Plugins ------
call plug#begin()

" Aesthetics
Plug 'vim-airline/vim-airline'    " bufferline
Plug 'ryanoasis/vim-devicons'     " icons
Plug 'Yggdroot/indentLine'        " line indent
Plug 'mhinz/vim-startify'         " startify
Plug 'morhetz/gruvbox'            " colorscheme

" Functionalities
Plug 'preservim/tagbar'           " browse tags
Plug 'preservim/nerdtree'         " NERDTree
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'           " Fuzzyfinder
Plug 'tpope/vim-surround'         " parenthesis change
Plug 'jiangmiao/auto-pairs'       " auto parenthesis

" Completion, linters
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'davidhalter/jedi-vim'       " Python

" Git
Plug 'tpope/vim-fugitive'         " git commands

call plug#end()


""" ------ Plugin Settings ------
" NETrw
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_winsize=20
let g:netrw_keepdir=0
let g:netrw_localcopydircmd='cp -r'

" nerdtree
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1
let NERDTreeWinSize = 20
let NERDTreeQuitOnOpen = 1

" vim-airline
let g:airline_theme = 'gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" colorscheme
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

" tagbar
let g:tagbar_width = 20
:command TT TagbarToggle

" coc.nvim
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set signcolumn=yes
autocmd CursorHold * silent call CocActionAsync('highlight')

" startify
function! StartifyEntryFormat()
return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

autocmd VimEnter *
    \   if !argc()
    \ |   Startify
"   \ |   NERDTree
    \ | endif
