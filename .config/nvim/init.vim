" Rebind esc to jk for convinience
inoremap jk <Esc>

" 1 tab = 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Line numberings
set nu rnu

" Ctrl O for Omni Completion
inoremap <C-o> <C-x><C-o>

" Disable preview window
set completeopt-=preview

" Improve complete window
set completeopt=longest,menuone

" Use x11 clipboard
set clipboard=unnamedplus 

" I lyke colorz
colorscheme molokai

" NetRW settings
let g:netrw_banner = 0
" New files in new tab
let g:netrw_browse_split = 3

" Tags example
" Create tags in current folder:
" ctags -R --languages=php -f xenforo /var/www/html/src/XF
" Add tags to env
" set tags+=~/.config/nvim/tags/xenforo
" Tags
set tags+=~/.config/nvim/tags/xenforo

" Plugins
call plug#begin('~/.config/nvim/plugged')
    Plug 'mattn/emmet-vim'
    Plug 'vim-airline/vim-airline'
    Plug 'ervandew/supertab'
call plug#end()
