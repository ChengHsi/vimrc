"""""""""""""""""
" .vimrc by dm4 "
"               "
"""""""""""""""""

" pathogen.vim
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" About tab and indent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
"set cindent

" backup info
set backup
set backupdir=$HOME/.vim/backup/
if exists("*mkdir") && !isdirectory($HOME."/.vim/backup")
    call mkdir($HOME."/.vim/backup")
endif

" set line break
set wrap
set linebreak
set showbreak=>>\ 
"
set nu
syntax on
set ruler
set mouse=a
set bs=2
set nocompatible

" set foldmethod
set fdm=indent
autocmd BufRead * exe "folddoc foldopen"

" set filetype
autocmd BufReadPost,BufNewFile *.tt set filetype=html

" key mapping
nmap ; :
vmap ; :
imap <C-D>      <DEL>
nmap <F7>       :w<CR>:!perl %<CR>
nmap <C-L>      :set nu!<CR>
nmap <C-n>      gt
nmap <C-p>      gT
imap <C-a>      <HOME>
imap <C-e>      <END>
imap <C-f>      <RIGHT>
imap <C-b>      <LEFT>
nmap <Leader>n  :NERDTreeToggle<CR>
nmap <Leader>b  :e ++enc=big5<CR>
nmap <Leader>u  :e ++enc=utf-8<CR>
" for fakeclip
vmap <Leader>v "+y
" ctrl-tab only works on gui
nmap <C-Tab>  gt

" Encoding
set fileencodings=utf-8,big5,euc-jp,gbk,euc-kr,utf-bom,iso8859-1

" Detect filetype
filetype on
filetype indent on
filetype plugin on

" color setting
if ($TERM == "xterm-color") || has("gui_macvim")
    " set 256 colors
    set t_Co=256
    if filereadable($HOME."/.vim/colors/yzlin256.vim")
        colors yzlin256
    endif
    hi CursorLine       term=none cterm=none ctermbg=234
    set cursorline
elseif ($TERM == "xterm")
    set t_Co=16
endif

" For macvim
if has("gui")
    set guifont=Monaco:h15
    hi CursorLine guibg=gray10
    " hide tool bar
    set guioptions+=c
    set guioptions-=e
    set guioptions-=T
    set guioptions-=m
    set guioptions-=r
    set guioptions-=R
    set guioptions-=l
    set guioptions-=L
    " disable input manager
	set imdisable
	set antialias
    " set window size (now in .gvimrc)
    "set lines=25
    "set columns=80
    " set CMD+ENTER fullscreen
	set fuopt=maxhorz,maxvert
    " for eclim
	" <cmd + shift + L>
	map <D-L> :ProjectList<CR>
	map <D-C> :ProjectCreate 
	map <D-E> :ProjectTree<CR>
	map <D-D> :ProjectDelete 
    " window size
    set lines=30
    set columns=80
endif

" Save last postion
if has("autocmd")
   autocmd BufReadPost *
      \ if line("'\"") > 0 && line ("'\"") <= line("$") |
      \   exe "normal g'\"" |
      \ endif
endif

" for eclim
"let g:EclimProjectTreeAutoOpen=1

" for Rainbow
"let g:hlrainbow="{[("
"autocmd BufNewFile,BufReadPost *.c,*.cpp,*.C,*.m,*.mm,*.h,*.hpp  Rainbow
