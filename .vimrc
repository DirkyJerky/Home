set shiftwidth=4
set expandtab
set softtabstop=4
set autoindent
set backspace=indent
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set encoding=utf8
set lbr
set tw=500
set ruler
set number
set backspace=2
set exrc
set secure
set nocompatible              " be iMproved, required
set showmode

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" Unbind the cursor keys in insert, normal and visual modes.
for prefix in ['i', 'n', 'v']
    for key in ['<Up>', '<Down>', '<Left>', '<Right>']
        exe prefix . "noremap " . key . " <Nop>"
    endfor
endfor

syntax enable

cmap w!! w !sudo tee % > /dev/null

filetype off 

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'

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
" Put your non-Plugin stuff after this line
"
