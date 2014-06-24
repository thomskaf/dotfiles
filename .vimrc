set nocompatible    " Use Vim settings, rather then Vi settings (much better!).
set ts=4            " Sets tab stop to 4
set tabstop=4       " The number of space characters that will be inserted when the tab key is pressed
set expandtab       " Use spaces whenever the tab key is pressed
set shiftwidth=4    " The number of space characters inserted for indentation
set ignorecase      " Ignore case of searches
set nohlsearch      " Disable search highlighting
set vb t_vb=        " Disable both the bell and the visual flash when searching.
set number          " Display line numbers
set nowrap          " Don't wrap lines
set title           " Show the filename in the window titlebar
set encoding=utf-8 nobomb       " Use UTF-8 without BOM
set backspace=indent,eol,start  " Allow backspacing over everything in insert mode
set ruler            " Enable the ruler
autocmd FileType python set colorcolumn=80  " Sets the colorcolumn to 80 for .py files 

if &t_Co > 2 || has("gui_running")  " Switch syntax highlighting on, when the terminal has colors
    syntax on
    highlight Comment ctermfg=DarkGreen
    highlight Constant ctermfg=DarkMagenta
    highlight Character ctermfg=DarkRed
    highlight Special ctermfg=DarkBlue
    highlight Identifier ctermfg=DarkCyan
    highlight Statement ctermfg=DarkBlue
    highlight PreProc ctermfg=DarkBlue
    highlight Type ctermfg=DarkBlue
    highlight Number ctermfg=DarkBlue
    highlight Delimiter ctermfg=DarkBlue
    highlight Error ctermfg=Black
    highlight Todo ctermfg=DarkBlue
    highlight WarningMsg term=NONE ctermfg=Black ctermbg=NONE
    highlight ErrorMsg term=NONE ctermfg=DarkRed ctermbg=NONE
endif
