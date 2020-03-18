" Bind esc to jk for convinience
inoremap jk <Esc>

" Control Arrows for Tabs
map <C-Right> :tabnext<CR>
map <C-Left> :tabprevious<CR>

" 1 tab = 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Line numberings
set nu rnu

" Ctrl O for Omni Completion
inoremap <C-o> <C-x><C-o>

" Ctrl F for File Completion
inoremap <C-f> <C-x><C-f>

" Improve complete window
set completeopt=longest,menuone

" Use x11 clipboard
set clipboard=unnamedplus 

" Wrap long lines properly
set nolist wrap linebreak breakat&vim

" NetRW settings
let g:netrw_banner = 0
