inoremap jk <Esc>
" 1 tab = 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab
" Line numberings
set nu rnu
" Disable preview window
set completeopt-=preview
" Improve complete window
set completeopt=longest,menuone
" Let supertab use Omni by default
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
" I lyke colorz
colorscheme molokai

" Plugins
call plug#begin('~/.config/nvim/plugged')
    Plug 'mattn/emmet-vim'
    Plug 'vim-airline/vim-airline'
    Plug 'ervandew/supertab'
call plug#end()
