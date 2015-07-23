set nocompatible              " be iMproved
filetype off                  " required!


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Vim Plugins
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Align'
Plugin 'mxw/vim-jsx'
Plugin 'vim-scripts/openscad.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax on

if !exists("autocommands_loaded")
  let autocommands_loaded = 1
  autocmd BufRead,BufNewFile,FileReadPost *.py source ~/.vim/python
endif

" This beauty remembers where you were the last time you edited the file, and returns to the same position.
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" add line numbers to vim display
set number

" set folding method
set foldmethod=indent
set foldcolumn=1
set foldlevel=99

highlight LineNr term=bold cterm=NONE ctermfg=brown ctermbg=NONE gui=NONE guifg=brown guibg=NONE

" adjust colors
set background=dark

set hlsearch

set ignorecase

filetype plugin on

set backspace=indent,eol,start

set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" split key mappings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" split preferences
set splitbelow
set splitright

" make copy/paste go to the clipboard
:set clipboard=unnamed

" change swap directory
set directory=~/.backup,/tmp
set backupdir=~/.backup,/tmp

" " add some automatic bracket and such fun
" inoremap ( ()<Esc>i
" inoremap [ []<Esc>i
" inoremap { {}<Esc>i
" inoremap " ""<Esc>i
" inoremap ' ''<Esc>i
" inoremap ) <c-r>=ClosePair(')')<CR>
" inoremap ] <c-r>=ClosePair(']')<CR>
" inoremap } <c-r>=ClosePair('}')<CR>
" inoremap " <c-r>=QuoteDelim('"')<CR>
" inoremap ' <c-r>=QuoteDelim("'")<CR>
"
" function ClosePair(char)
"     if getline('.')[col('.') - 1] == a:char
"         return "\<Right>"
"     else
"         return a:char
"     endif
" endf
"
" function QuoteDelim(char)
"     let line = getline('.')
"     let col = col('.')
"     if line[col - 2] == "\\"
"         "Inserting a quoted quotation mark into the string
"         return a:char
"     elseif line[col - 1] == a:char
"         "Escaping out of the string
"         return "\<Right>"
"     else
"         "Starting a string
"         return a:char.a:char."\<Esc>i"
"     endif
" endf
"
