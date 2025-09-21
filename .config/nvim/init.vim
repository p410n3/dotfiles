" 1 tab = 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab
set nowrap
set mouse=

" Line numberings
set nu rnu

" Smart case search
set ignorecase

" Split below
set splitbelow

" Rebind Tag thingie
nnoremap <c-G> g]

" Exclude tags from complete
set complete-=t

" Make vim treat a hyphen like a regular word character - makes autocomplete
" for CSS much easier
set iskeyword+=-

" Some autocomplete options - i forgot what they do
set completeopt=longest,menuone

" Use x11 clipboard
set clipboard=unnamedplus 

" Cooler looking popupmenu
highlight Pmenu ctermbg=235 ctermfg=231 

" Highlight the current line so I dont lose sight of it
set cursorline
highlight CursorLine cterm=NONE ctermbg=235

" Set the whole ctermbg slightly darker
highlight Normal ctermbg=200

call plug#begin()
    " fzf native plugin
    Plug 'junegunn/fzf'
    " fzf.vim
    Plug 'junegunn/fzf.vim'
    " Fugitve
    Plug 'tpope/vim-fugitive'
    " Oil
    Plug 'stevearc/oil.nvim'
call plug#end()

" Oil again
lua require("oil").setup()

" Ctrl F for FZF
map <C-f> :FZF<CR>

" Ctrl B for Buffers
map <C-b> :Buffers<CR>

" Make FZF-AG use the 'follow' option by default
let g:fzf_ag_follow = 1

" Set filetype=html for .twig files
autocmd BufNewFile,BufRead *.twig set filetype=html

" Load PHP helpers
lua require('php_use_helper')
nnoremap <silent> <C-u> :lua require('php_use_helper').find_and_insert_use_statement()<CR>

lua require('php_expand_classnames_helper')
nnoremap <silent> <C-e> :lua require('php_expand_classnames_helper').expand_classnames_helper()<CR>
