set encoding=utf8 " UTF8 master race
set lazyredraw " Dont redraw when don't need too
set nocompatible " Vim not Vi
set noerrorbells " No error beeps
set novisualbell " No visual beeps
set timeoutlen=500 " Time for macros to work
" set tags+=~/.vim/tags "Tag file
set wildmenu " Visual completion

set cursorline " Underline whole line of cursor
set number " Line numbers
set ruler " Cursor and file poistion in lower right
set showmode " Show which mode we in
"set linebreak=' ' " wrap lines on ' ' instead of limit

set incsearch " Search as chars entered
set hlsearch " Highlight matches

set exrc " Run ./.vimrc
set secure " Only let local ./.vimrc files set settings

set autoindent " Copy indent from previous line when making new line
set backspace=indent,eol,start " Allow BS over autoindent, Linebreaks, and out of insert mode
set expandtab " '\t' -> ' ' x 4
set shiftwidth=4 " Autoindent with four spaces
set softtabstop=4 " Tab spaces for editing
set tabstop=4 " Tab spaces visual
set textwidth=500 " Max characters in line

" set foldenable " Enable folding
" set foldlevelstart=10 " Open most folds
" set foldnestmax=10 " Max nested folds
" set foldmethod=indent

" Set F2 to toggle paste mode in I-mode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" Dont use backupfiles with crontab so 'crontab -e' will be happy
autocmd filetype crontab setlocal nobackup nowritebackup " L

" LEARNING
" Unbind the cursor keys in insert, normal and visual modes.
" Because hjkl is way better
for prefix in ['n', 'v']
    for key in ['<Up>', '<Down>', '<Left>', '<Right>']
        exe prefix . "noremap " . key . " <Nop>"
    endfor
endfor

" Syntax highlighting
syntax enable

"Rewrite file with sudo
cmap w!! w !sudo tee % > /dev/null

" VUNDLE START ----------------------
"
filetype off 

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/syntastic'
" Plugin 'Rip-Rip/clang_complete'
Plugin 'flazz/vim-colorschemes'

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
"
" VUNDLE END ------------------------

" Plugin configuration
"
let OmniCpp_MayCompleteScope = 1

let s:clang_library_path='/Library/Developer/CommandLineTools/usr/lib'
if isdirectory(s:clang_library_path)
    let g:clang_library_path=s:clang_library_path
endif
