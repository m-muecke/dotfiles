let mapleader = " "

" VSCode extension
xmap <leader>/ <Plug>VSCodeCommentary
omap <leader>/ <Plug>VSCodeCommentary
nmap <leader>/ <Plug>VSCodeCommentaryLine
" Better Navigation
nnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
xnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
nnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
xnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
nnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
xnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
nnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>
xnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>

nnoremap <silent> <leader>e :call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>
xnoremap <silent> <leader>e :call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>
