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
" Improve complete window
set completeopt=longest,menuone
colorscheme molokai

" Plugins
call plug#begin('~/.config/nvim/plugged')
    Plug 'mattn/emmet-vim'
    Plug 'vim-airline/vim-airline'
call plug#end()
