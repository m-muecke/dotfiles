colorscheme monokai
set cursorline
syntax enable
set number
set wrap
set colorcolumn=80
let g:rehash256 = 1
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" for R files, 2 spaces
autocmd Filetype r setlocal ts=2 sw=2 expandtab
" for Rmd files, 2 spaces
autocmd Filetype rmd setlocal ts=2 sw=2 expandtab

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>

tnoremap <Esc> <C-\><C-n>

call plug#begin('~/.local/share/nvim/plugged')

Plug 'davidhalter/jedi-vim'
Plug 'zchee/deoplete-jedi'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-ai

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

let  g:airline_theme='minimalist'
