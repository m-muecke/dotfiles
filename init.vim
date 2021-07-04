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
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
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
" snippets
Plug 'honza/vim-snippets'
" Colorscheme
Plug 'gruvbox-community/gruvbox'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kassio/neoterm'
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

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1
let mapleader = " "

let g:netrw_browse_split = 2
let g:vrfr_rg = 'true'
let g:netrw_banner = 0
let g:netrw_winsize = 25

nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>
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

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()


" telescope mappings
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

" completition-nvim settings
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" Specify matching strategy
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" tree-sitter
lua <<EOF
require 'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
    }
}
EOF

" nvim-lspconfig

"lua << EOF
"local nvim_lsp = require('lspconfig')
"
"-- Use an on_attach function to only map the following keys
"-- after the language server attaches to the current buffer
"local on_attach = function(client, bufnr)
"  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
"  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
"
"  --Enable completion triggered by <c-x><c-o>
"  -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
"
"  -- Mappings.
"  local opts = { noremap=true, silent=true }
"
"  -- See `:help vim.lsp.*` for documentation on any of the below functions
"  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
"  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opt)
"  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
"  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
"  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
"  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
"  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
"  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
"  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
"  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
"  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
"  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
"  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
"  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
"  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
"  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
"  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
"
"  require'completion'.on_attach(client, bufnr)
"end
"
"nvim_lsp.tsserver.setup{
"  on_attach = on_attach
"}
"
"nvim_lsp.r_language_server.setup{
"  on_attach = on_attach
"}
"
"EOF

lua << EOF
require'lspconfig'.pyright.setup{on_attach=require'completion'.on_attach}
require'lspconfig'.r_language_server.setup{on_attach=require'completion'.on_attach}
require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}
EOF
