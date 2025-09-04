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

" Rebind Tag thingie
nnoremap <c-G> g]

" Quicker omni complete
inoremap <C-o> <C-x><C-o>

" Exclude tags from complete
set complete-=t

" Make vim treat a hyphen like a regular word character - makes autocomplete
" for CSS much easier
set iskeyword+=-

" Some autocomplete options - i forgot what they do
set completeopt=longest,menuone

" Use x11 clipboard
set clipboard=unnamedplus 

" Wrap long lines properly
set nolist wrap linebreak breakat&vim

" NetRW settings
let g:netrw_banner = 0

" Set filetype=html for .twig files
autocmd BufNewFile,BufRead *.twig set filetype=html

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
    " Fugitve
    Plug 'tpope/vim-fugitive'
call plug#end()

" Ctrl F for FZF
map <C-f> :Files<CR>

" Ctrl A for FZF-AG
map <C-a> :Ag<CR>
" Make FZF-AG use the 'follow' option by default
let g:fzf_ag_follow = 1

" Ctrl B for Commits in Buffer
map <C-b> :BCommits<CR>

" Ctrl C for Commits 
map <C-c> :Commits<CR>

" Load PHP helpers
lua require('php_use_helper')
nnoremap <silent> <C-u> :lua require('php_use_helper').find_and_insert_use_statement()<CR>

lua require('php_expand_classnames_helper')
nnoremap <silent> <C-e> :lua require('php_expand_classnames_helper').expand_classnames_helper()<CR>
