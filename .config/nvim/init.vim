" 1 tab = 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab
set nowrap
set mouse=
 
set termguicolors
colorscheme default
 
" Line numberings
set nu rnu
 
" Smart case search
set ignorecase
 
" Split below
set splitbelow
 
" Exclude tags from complete
set complete-=t
 
" Some autocomplete options - i forgot what they do
set completeopt=longest,menuone
 
" Use x11 clipboard
let g:clipboard = {
            \   'name': 'WslClipboard',
            \   'copy': {
            \      '+': 'clip.exe',
            \      '*': 'clip.exe',
            \    },
            \   'paste': {
            \      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            \      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            \   },
            \   'cache_enabled': 0,
            \ }
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

" Quickfix list navigation
map <A-right> :cnext<CR>
map <A-left> :cprev<CR>
 
" Ctrl F for FZF
map <C-f> :FZF<CR>
 
" Ctrl D for Ag (Ctrl A is a useful default binding and Ctrl-D is right next to F)
map <C-d> :Ag<CR>
 
" Ctrl B for Buffers
map <C-b> :Buffers<CR>
 
" Makeshift version of see usages by using FZF to search for string
nnoremap <c-H> "pyiw:execute ":Ag " . escape(getreg("p"), '\')<CR>
 
" Use FZF Tags instead of builtin because the UI is more easy to parse for me
nnoremap <c-G> "pyiw:execute ":Tags " . escape(getreg("p"), '\')<CR>
 
" Some common abbrevs for me
cnoreabbrev c Commits
cnoreabbrev h History
cnoreabbrev bc BCommits
cnoreabbrev o Oil
cnoreabbrev m Marks
 
" Make FZF-AG use the 'follow' option by default
let g:fzf_ag_follow = 1
 
" Better FZF Preview window
let g:fzf_vim = {}
let g:fzf_vim.preview_window = ['up,40%', 'ctrl-/']
 
" Set filetype=html for .twig files
autocmd BufNewFile,BufRead *.twig set filetype=html
 
" Load PHP helpers
" lua require('php_use_helper')
" nnoremap <silent> <C-u> :lua require('php_use_helper').find_and_insert_use_statement()<CR>
"  
" lua require('php_expander')
" nnoremap <silent> <C-e> :lua require('php_expander').expand_php_use()<CR>
