" Settings {{{

" General {{{
set encoding=utf8 " UTF8 master race
set lazyredraw " Dont redraw when don't need too
set nocompatible " Vim not Vi
set noerrorbells " No error beeps
set novisualbell " No visual beeps
set timeoutlen=500 " Time for macros to work
" set tags+=~/.vim/tags "Tag file
set wildmenu " Visual completion
set modelines=1 " Last line specifies settings
" }}}

" Visual Guides {{{
set cursorline " Underline whole line of cursor
set number " Line numbers
set ruler " Cursor and file poistion in lower right
set showmode " Show which mode we in
"set linebreak=' ' " wrap lines on ' ' instead of limit
" }}}

" Searching {{{
set incsearch " Search as chars entered
set hlsearch " Highlight matches
" }}}

" Directory Settings {{{
set exrc " Run ./.vimrc
set secure " Only let local ./.vimrc files set settings
" }}}

" Indenting and Deleting {{{
set autoindent " Copy indent from previous line when making new line
set backspace=indent,eol,start " Allow BS over autoindent, Linebreaks, and out of insert mode
set expandtab " '\t' -> ' ' x 4
set shiftwidth=4 " Autoindent with four spaces
set softtabstop=4 " Tab spaces for editing
set tabstop=4 " Tab spaces visual
set textwidth=500 " Max characters in line
" }}}

" Folds {{{
set foldenable " Enable folding
set foldlevelstart=10 " Open most folds
set foldnestmax=10 " Max nested folds
set foldmethod=indent
" }}}

" }}}

" Mappings {{{

" Leader
let mapleader="," 

" Set F2 to toggle paste mode in I-mode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" Gundo!
nnoremap <leader>u :GundoToggle<CR>

" jk to escape I-mode
inoremap jk <esc> 

" }}}

" File specific indenting and stuff {{{
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn " Clear sign column on enter?
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END
" }}}

" Dont use backupfiles with crontab so 'crontab -e' will be happy
autocmd filetype crontab setlocal nobackup nowritebackup " L

" LEARNING
" Unbind the cursor keys in normal and visual modes.
" Because hjkl is way better
for prefix in ['n', 'v']
    for key in ['<Up>', '<Down>', '<Left>', '<Right>']
        exe prefix . "noremap " . key . " <Nop>"
    endfor
endfor

nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>s :mksession<CR>
nnoremap <space> za

" Syntax highlighting
syntax enable

" 
" Rewrite file with sudo
cmap w!! w !sudo tee % > /dev/null

" Vundle Stuff {{{
" Prerequisites {{{
filetype off 

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" }}}

Plugin 'gmarik/Vundle.vim' " Vundle
Plugin 'scrooloose/syntastic' " Syntax checking using local tools
" Plugin 'Rip-Rip/clang_complete'
Plugin 'flazz/vim-colorschemes' " Many colors
Plugin 'sjl/gundo.vim' "Gundo
Plugin 'rking/ag.vim' "The Silver Searcher for vim

" Postrequisites {{{
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ

" }}}
" }}}

" Plugin configuration {{{

let OmniCpp_MayCompleteScope = 1

let s:clang_library_path='/Library/Developer/CommandLineTools/usr/lib'
if isdirectory(s:clang_library_path)
    let g:clang_library_path=s:clang_library_path
endif

" }}}

" vim:foldmethod=marker:foldlevel=0
