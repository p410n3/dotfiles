" Control Arrows for Tabs
map <C-Right> :tabnext<CR>
map <C-Left> :tabprevious<CR>

" 1 tab = 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Line numberings
set nu rnu

" Smart case search
set ignorecase

" Split below
set splitbelow

" Crtl space is more comfy than Ctrl n
inoremap <C-space> <C-n>

" Ctrl O for Omni Completion
inoremap <C-o> <C-x><C-o>

set completeopt=longest,menuone

" Use x11 clipboard
set clipboard=unnamedplus 

" Wrap long lines properly
set nolist wrap linebreak breakat&vim

" NetRW settings
let g:netrw_banner = 0

" Cooler looking popupmenu
highlight Pmenu ctermbg=235 ctermfg=231 

" Highlight the current line so I dont lose sight of it
set cursorline
highlight CursorLine cterm=NONE ctermbg=235

" Set the whole ctermbg slightly darker
highlight Normal ctermbg=234

call plug#begin()
    " fzf native plugin
    Plug 'junegunn/fzf'
    " fzf.vim
    Plug 'junegunn/fzf.vim'
call plug#end()

" Ctrl F for FZF
map <C-f> :Files<CR>

" Ctrl A for FZF-AG
map <C-a> :Ag<CR>