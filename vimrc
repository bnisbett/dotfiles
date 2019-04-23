" General "{{{
set nocompatible        " disable vi compatibility
set number              " show line numbers
set history=256         " number of things to remember in history
set clipboard+=unnamed  " yanks go on clipboard instead.
set timeoutlen=250      " time to wait after ESC (default causes an annoying delay)
set pastetoggle=<F4>   " toggle between paste and normal: for 'safer' pasting from keyboard

" Backup
set nowritebackup
set nobackup

" Buffers
set hidden " the current buffer can be put to the background without saving

" Match and search
set incsearch "find the next match as we type the search
set hlsearch  "hilight searches by default
" "}}}

" Visual "{{{
syntax on    " enable syntax highlighting
set t_Co=256 " enable 256 colors

set showmatch   " show matching brackets.
set matchtime=5 " bracket blinking.

set novisualbell " no blinking
set noerrorbells " no noise.
set vb t_vb=     " disable any beeps or flashes on error

set mouse-=a  " disable mouse
set mousehide " hide mouse after chars typed

set splitbelow " split vertically below the current window
set splitright " split horizontally right to the current window

set listchars=tab:>-,trail:. " set unwanted whitespace char list
set list                     " highlight unwanted whitespace
set showcmd                  " display an incomplete command in the lower right
" "}}}

" Formatting "{{{
set fo+=o " automatically insert the current comment leader after hitting 'o' or 'O'
set fo-=r " don't automatically insert a comment leader after an enter
set fo-=t " don't auto-wrap text using textwidth (does not apply to comments)

set nowrap
set textwidth=0                 " don't wrap lines by default
set wildmode=list:longest       " make cmdline tab completion similar to bash
set backspace=indent,eol,start	" more powerful backspacing

" Indenting
set tabstop=2                   " set the default tabstop
set softtabstop=2               " set tabstop for insert mode
set shiftwidth=2                " set the default shift width for indents
set expandtab                   " make tabs into spaces (set by tabstop)
set smarttab                    " smarter tab levels
set autoindent
" "}}}

" Auto Commands "{{{
au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru} set ft=ruby
au BufRead,BufNewFile {*.md,*.mkd,*.markdown}                     set ft=markdown
au BufRead,BufNewFile {COMMIT_EDITMSG}                            set ft=gitcommit
au BufRead,BufNewFile {*.es6}                                     set ft=javascript
au BufWritePre *.{eex,ex,exs,rb,py,js,hs,c,h,haml,erb,rake,txt} :%s/\s\+$//e  " Strip whitespace on save
au BufWritePost *.exs,*.ex silent :!mix format % " Run mix format on file save
" "}}}

" Key Mappings "{{{
" Split window navigation
noremap ,h <C-w>h
noremap ,j <C-w>j
noremap ,k <C-w>k
noremap ,l <C-w>l
" "}}}

" Statusline "{{{
set statusline=%f     " tail of the filename
set statusline+=%h    " help file flag
set statusline+=%y    " filetype
set statusline+=%r    " read only flag
set statusline+=%m    " modified flag
set statusline+=%=    " left/right separator
set statusline+=%c,   " cursor column
set statusline+=%l/%L " cursor line/total lines
set statusline+=\ %P  " percent through file
set laststatus=2      " always show statusline

" display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*
"
" "}}}

call plug#begin('~/.vim/plugged')

" colorschemes
Plug 'tomasr/molokai'
Plug 'ciaranm/inkpot'
Plug 'jgdavey/vim-railscasts'

" programming
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'

Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] } "Loads only when opening NERDTree
noremap <silent> <F1> :NERDTreeToggle<CR>

Plug 'corntrace/bufexplorer'
noremap <silent> <F2> :BufExplorer<CR>

set rtp+=/usr/local/opt/fzf
Plug 'junegunn/fzf.vim'
noremap <silent> <F3> :Files<CR>

Plug 'leafgarland/typescript-vim'
Plug 'elixir-editors/vim-elixir'

call plug#end()
colorscheme railscasts
