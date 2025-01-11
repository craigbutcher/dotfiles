" Vim-Plug
call plug#begin('~/.vim/plugged')

" Theme
Plug 'morhetz/gruvbox'

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Emmet
Plug 'mattn/emmet-vim', {'for': ['html', 'css']}

" Commentary.vim
Plug 'tpope/vim-commentary'

" Initialize plugin system
call plug#end()

syntax on " enable syntax processing
filetype plugin indent on   " enable detection, plugins and indent

" General configuration options
set nocompatible
set backspace=indent,eol,start
set history=1000
set showcmd
set showmode
set autoread
set hidden

" User Interface Options
set t_Co=256
set laststatus=2
set ruler
set wildmenu
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*
set wildignore+=*.DS_STORE,*.db,node_modules/**,*.jpg,*.png,*.gif
set tabpagemax=40
set termguicolors
set colorcolumn=80
set background=dark
colorscheme gruvbox

set cursorline
set number
set noerrorbells
set mouse=a
set title

set listchars=tab:▹\ ,trail:·,nbsp:_
set fillchars=fold:-
set list

" Set leader
let mapleader = "\<Space>"

" Swap and backup file options - disable all of them
set noswapfile
set nobackup
set nowb

" Set undo option
set undofile "maintain undo history between sessions
set undodir=$HOME/.vim/undodir

" Indentation options
set autoindent
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Search options
set incsearch
set hlsearch
set ignorecase
set smartcase
nnoremap <leader><space> :nohlsearch<CR>

" Text rendering options
set encoding=utf-8
set linebreak
set scrolloff=3
set sidescrolloff=5
syntax enable

" Miscellaneous options
set confirm
set nomodeline
set nrformats-=octal
"set shell - commented out as it keeps asking?
set spell

" Status line
set laststatus=2
set laststatus=2
set statusline=
set statusline+=\ %f

" Project specific .vimrc
" Enable project specific vimrc
" set exrc
" You will then need to set .vimrc in your project.

" Buffer Cycling
map <C-K> :bprev<CR>
map <C-J> :bnext<CR>

" Folding
set foldenable "enable folding
set foldlevelstart=10 "open most of the folds by defaults. if set to 0, all folds will be closed.
set foldnestmax=10 "folds can be nested, setting a max value protects you from too many folds.
set foldmethod=manual "defines the type of folding.
set foldcolumn=2

" Leader Key
nnoremap <Leader>w :w<CR>
vmap <Leader>y "+y

" Auto remove trailing whitespace
" highlight trailing whitespace
match ErrorMsg '\s\+$'
" remove trailing whitespaces automatically
autocmd BufWritePre * :%s/\s\+$//e

" Jump back to last edited buffer
nnoremap <C-b> <C-^>
inoremap <C-b> <esc><C-^>

" NetRW
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 15
let g:netrw_banner = 0
let g:netrw_altv = 1
"augroup ProjectDrawer
"    autocmd!
"    autocmd VimEnter * :Vexplore
"augroup end

" FZF (Fuzzy Finder)
nnoremap <Leader>ff :FZF<CR>

" Show me Buffers
nnoremap <Leader>bb :Buffers<CR>
nnoremap <Leader>bd :bdelete<CR>
