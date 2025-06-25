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

" Crtl Space for Keyword Completion
" inoremap <C-Space> <C-x><C-n>

" Crtl O for Omni
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

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-u': { f -> f->map({->substitute(v:val, '\.php$', ';', 'g') })->map({->substitute(v:val, '^src\/', 'use ', 'g') })->map({->substitute(v:val, '\/', '\', 'g') })->join("\n")->setreg('+') }}

" Ctrl F for FZF
map <C-f> :Files<CR>

" Ctrl A for FZF-AG
map <C-a> :Ag<CR>

" Ctrl C for Commits in Buffer
map <C-b> :BCommits<CR>
