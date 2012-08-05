set noerrorbells "Supress errors
set showcmd

if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,latin1
endif

set nocompatible        " Use Vim defaults (much better!)
" set bs=indent,eol,start  " allow backspacing over everything in insert mode
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
                        " than 50 lines of registers
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time

" Default indenting and shit.

" Indenting
set smartindent
set autoindent

" Default Tab settings
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smarttab

" Status line
set statusline=%F%m%r%h%w\ ft=%y\ hex=\%02.2B\ %04l,%04v\ %p%%\ LEN=%L\ FMT=%{&ff}
set laststatus=2
set modeline

" Search
set incsearch
set hlsearch

" Only do this part when compiled with support for autocommands
if has("autocmd")
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \   if line("'\"") > 0 && line ("'\"") <= line("$") |
    \       exe "normal! g'\"" |
    \   endif

    " Python support
    autocmd Filetype python set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
    autocmd Filetype python set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
    autocmd Filetype python nmap <F5> :!python %<CR>
    autocmd Filetype python nmap <F6> :!python -m doctest -v 2>&1 %<CR>
    autocmd Filetype python set sw=4 tabstop=4 softtabstop=4

    " For Athena
    autocmd BufRead *athena/*.py set shiftwidth=2 tabstop=2 softtabstop=2
    autocmd BufNew *athena/*.py set shiftwidth=2 tabstop=2 softtabstop=2
    " 'quote' a word
    autocmd Filetype python nnoremap qw :silent! normal mpea'<Esc>bi'<Esc>`pl
    " double "quote" a word
    autocmd Filetype python nnoremap qd :silent! normal mpea"<Esc>bi"<Esc>`pl
    " remove quotes from a word
    autocmd Filetype python nnoremap wq :silent! normal mpeld bhd `ph<CR>

    autocmd Filetype htmldjango set sw=2 tabstop=2 softtabstop=2
    autocmd Filetype css set sw=2 tabstop=2 softtabstop=2

    " Java support
    autocmd Filetype java nmap <F5> :!java `echo % \| sed -e 's/\.java$//' -e 's/\//./g'`<CR>
    autocmd Filetype java nmap <F6> :!javac %<CR>

    " Scheme support
    autocmd filetype make set noexpandtab

    " TeX support
    autocmd filetype tex nmap <F5> {!}fmt<Enter>}k<End>
    autocmd filetype tex nmap <F6> :!latex %<CR>:!export V_NAME=`basename % .latex` && dvips -t letter -Ppdf $V_NAME.dvi && ps2pdf $V_NAME.ps && rm -f $V_NAME.log $V_NAME.aux $V_NAME.ps $V_NAME.dvi && evince $V_NAME.pdf<CR>

    " txt support
    autocmd BufRead *.txt nmap <F5> {!}fmt<Enter>}k<End>
    autocmd BufNew *.txt nmap <F5> {!}fmt<Enter>}k<End>
endif

if has("cscope") && filereadable("/usr/bin/cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
endif

if &term=="xterm"
    set t_Co=8
    set t_Sb=[4%dm
    set t_Sf=[3%dm
endif

map <C-J> <C-W>j<C-W>
map <C-K> <C-W>k<C-W>
set wmh=0

" Fix backspace on some terminals
set backspace=2
imap <C-?> <C-h>
cmap <C-?> <C-h>

if has("syntax")
    set nohlsearch
    syntax on
endif

if has("filetype")
    filetype on
    filetype plugin on
endif

set background=dark
set scrolloff=10
" nmap <F5> {!}fmt<Enter>}k<End>
" nmap <F6> :!wc %<Enter>

" Code completion
inoremap <Nul> <C-x><C-o>
