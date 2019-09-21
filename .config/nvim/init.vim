inoremap jk <Esc>
" Ctrl O for Omni Completion
inoremap <C-o> <C-x><C-o>
set tabstop=4
set shiftwidth=4
set expandtab
" Line numberings
set nu rnu
" Disable preview window
set completeopt-=preview
colorscheme molokai

" Plugins
call plug#begin('~/.config/nvim/plugged')
    Plug 'mattn/emmet-vim'
call plug#end()
