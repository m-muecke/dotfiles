" yank and paste to register
set clipboard+=unnamedplus
set splitright
" Disable cursor-styling for each mode.
set guicursor=
" Turn off swap files and backup files.
set noswapfile
set nobackup
" Enable undofiles.
set undodir=${HOME}/.config/nvim/undodir
set undofile
set termguicolors
set scrolloff=8
set smartindent
set noshowmode
" Give more space for displaying messages.
set cmdheight=1
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=
" Set encoding to UTF-8
set encoding=UTF-8

set nocompatible
" Turn on syntax highlighting.
syntax enable
" Disable the default Vim startup message.
set shortmess+=I
" Show line numbers and relative line numbers.
set nu
set relativenumber
" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2
" Enable backspace everywhere, not just insert mode.
set backspace=indent,eol,start
" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden
" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase
" Enable searching as you type, rather than waiting till you press enter.
set incsearch
" Disable highlighting during search.
set nohlsearch
" Turn of automatic matching.
set noshowmatch
" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.
" Uncomment to enable mouse support.
" set mouse+=a
" Enable cursorline.
set cursorline
set nowrap
" Enable column line at 80 character width.
" set colorcolumn=80
let g:rehash256 = 1

" spacing
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
" for html files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 expandtab
" for css files, 2 spaces
autocmd Filetype css setlocal ts=2 sw=2 expandtab
" for js files, 2 spaces
autocmd Filetype js setlocal ts=2 sw=2 expandtab
" for js files, 2 spaces
autocmd Filetype vue setlocal ts=2 sw=2 expandtab

call plug#begin('~/.config/nvim/plugged')
" python code formatter
Plug 'psf/black'
" language server
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'glepnir/lspsaga.nvim'
" git wrapper
Plug 'tpope/vim-fugitive'
" status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-multiple-cursors'
" snippets
Plug 'honza/vim-snippets'
" python indenting
Plug 'Vimjas/vim-python-pep8-indent'
" Colorscheme
Plug 'gruvbox-community/gruvbox'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
call plug#end()

let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection=0

colorscheme gruvbox
set background=dark

" change airline theme to minimal
let g:airline_theme='minimalist'

" --- vim go (polyglot) settings.
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1
let mapleader = " "

let g:netrw_browse_split = 2
let g:vrfr_rg = 'true'
let g:netrw_banner = 0
let g:netrw_winsize = 25

nnoremap <leader>ga :Git fetch --all<CR>
nnoremap <leader>grum :Git rebase upstream/master<CR>
nnoremap <leader>grom :Git rebase origin/master<CR>
nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Sweet Sweet FuGITive
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()


" Using lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

lua << EOF
local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' >',
        color_devicons = true,

        file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
            },
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}

require('telescope').load_extension('fzy_native')
EOF

nmap <leader>tr :vnew term://zsh<bar>:set nonu nornu<bar>:vertical resize 80<CR>iradian<CR>
nmap <leader>tp :vew term://zsh<bar>:set nonu nornu<bar>:vertical resize 80<CR>isource venv/bin/activate<CR>python3<CR>p

lua << EOF
require'lspconfig'.pyright.setup{on_attach=require'completion'.on_attach}
require'lspconfig'.r_language_server.setup{on_attach=require'completion'.on_attach}
EOF

" nvim-lsp settings
" map <c-p> to manually trigger completion
imap <silent> <c-p> <Plug>(completion_trigger)
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Specify matching strategy
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
