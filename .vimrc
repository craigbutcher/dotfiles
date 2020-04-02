if empty(glob("~/.vim/autoload/plug.vim"))
"    Ensure all needed directories exist  (Thanks @kapadiamush)
     execute 'mkdir -p ~/.vim/plugged'
     execute 'mkdir -p ~/.vim/autoload'
"    Download the actual plugin manager
     execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

" Call the plugin manager
call plug#begin('~/.vim/plugged')

    " --- Color schemes
    Plug 'taniarascia/new-moon.vim'
    " Plug 'altercation/vim-colors-solarized'

    " --- Make Vim useful
    " Nerdtree
    " Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

    " Fuzzy file opener
    " Plug 'ctrlpvim/ctrlp.vim'

    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

    " FZF
    Plug '~/.fzf'

    " Fancy statusline
    Plug 'bling/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    Plug 'tpope/vim-commentary'
    Plug 'wesQ3/vim-windowswap'

    " --- Front End Tools

    " Completion
    Plug 'mattn/emmet-vim', { 'for': ['html', 'css'] }

    " CSS colors
    Plug 'gorodinskiy/vim-coloresque', { 'for': 'css' }

    " JavaScript
    Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

    " Git
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'

    " Linting
    Plug 'vim-syntastic/syntastic'

    " Markdown
    Plug 'plasticboy/vim-markdown', { 'for' : 'markdown' }

    " --- Future use perhaps?
    " Plug 'vimwiki/vimwiki'

    " Other plugins require curl
    if executable("curl")

        " Webapi: Dependency of Gist-vim
        Plug 'mattn/webapi-vim'

        " Gist: Post text to gist.github
        Plug 'mattn/gist-vim'
    endif

    filetype plugin indent on  " required!

call plug#end()

if &compatible
      set nocompatible
  endif

filetype off

set shortmess+=I

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
" set tabstop=4
" set softtabstop=0
" set shiftwidth=2
" set expandtab
" set shiftround

"" Map leader to space
let mapleader=' '

nnoremap <silent> <leader><Space> :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"*****************************************************************************
"" TO BE DONE
"*****************************************************************************"

" -------------------------------------------------------------------"


"EASILY ESCAPE OR UNESCAPE HTML
"https://stackoverflow.com/posts/4858460/revisions

"function HtmlEscape()
"  silent s/&/\&amp;/eg
"  silent s/</\&lt;/eg
"  silent s/>/\&gt;/eg
"endfunction

"function HtmlUnEscape()
"  silent s/&lt;/</eg
"  silent s/&gt;/>/eg
"  silent s/&amp;/\&/eg
"endfunction

"map <silent> <c-h> :call HtmlEscape()<CR>
"map <silent> <c-u> :call HtmlUnEscape()<CR>

"HIGHLIGHT POTENTIALLY UNWANTED WHITESPACE
highlight BadWhitespace term=standout ctermbg=red guibg=red
match BadWhitespace /[^* \t]\zs\s\+$\| \+\ze\t/

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number
set t_Co=256
set cursorline "highline the current line

" Visual mode, use Y to copy to system clipboard
vnoremap Y "*y

" In normal mode, do the same with the current line
nnoremap Y "*yy

" On the Mac? Paste properly! Or it thinks you are typing
nmap <slient> <Leader>pbp :read !pbpaste<CR>

let no_buffers_menu=1

"if !exists('g:not_finsh_neobundle')
"  colorscheme Tomorrow-Night
"  set background=dark
"endif

set mouse=a
set mousemodel=popup
set t_Co=256
set guioptions=egmrti

if has("gui_running")
  " Gvim
    set guifont=mononoki:h11:cANSI:qDRAFT
  if has("gui_gtk2") || has("gui_gtk3")
    " Linux GUI
  elseif has("gui_win32")
    " Win32/64 GVim
    set guifont=mononoki:h11:cANSI:qDRAFT
  elseif has("gui_macvim")
    " MacVim
  else
    echo "Unknown GUI system!!!!"
  endif
else
    " Terminal vim
endif

set background=dark
colorscheme new-moon

set nocompatible " use vim, no vi defaults
set rnu          " relative line numbers
set number       " nowrap
set list         " show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode
set noswapfile                    " swap files are a pain in the ass

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen

" remove whitespace
nnoremap <localleader>w :%s/\s\+$//<cr>
" nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" automatically remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" toggle line numbers
nnoremap <localleader>l :set nonu! nornu!<cr>

" split screen
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" for emmet
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key=',,'
autocmd FileType html,css EmmetInstall

" clipboard
set clipboard=unnamed

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ----- all things javascript here

" eslint required here.
" let g:syntastic_javascript_checkers = ['eslint']
autocmd FileType javascript set formatprg=prettier\ --stdin

" ignore the cash when the search pattern is all lowercase
set smartcase
set ignorecase

" set columns=80
highlight ColorColumn ctermbg=Black
set colorcolumn=80

" ---- Mappings

" ---- Undo, backup, and swap file locations
" Don't leave .swp files everywhere. Put them in a central place
set directory=$HOME/.vim/swapdir//
set backupdir=$HOME/.vim/backupdir//
if exists('+undodir')
    set undodir=$HOME/.vim/undodir
    set undofile
endif

" Stop the manual from being called up
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" CSS properties in the correct order!
" nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

" Better escape
inoremap jj <ESC>
nnoremap <leader>iw <C-w>v<C-w>l

" Highlight tabs and trailing spaces
set listchars=tab:▸\ ,trail:•
set list                    " Make whitespace characters visible
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab shiftround

" Function to trim trailing white space
" Make your own mappings
function! StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

set ttimeoutlen=50 "time out.

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

let g:fzf_commits_log_options = '--graph --color=always
  \ --format="%C(yellow)%h%C(red)%d%C(reset)
  \ - %C(bold green)(%ar)%C(reset) %s %C(blue)<%an>%C(reset)"'

nnoremap <silent> <leader>c  :Commits<CR>
nnoremap <silent> <leader>bc :BCommits<CR>

" File Finder
nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>

" Buffer Finder
nmap <Leader>b :Buffers<CR>
nmap <Leader>h :History<CR>

" Line Finder
nmap <Leader>l :BLines<CR>
nmap <Leader>L :Lines<CR>
nmap <Leader>' :Marks<CR>

" History
nmap <Leader>: :History:<CR>
nmap <Leader>: :History/<CR>

" Key mappings
nmap <Leader>M :Maps<CR>
nmap <Leader>s :Filetypes<CR>


" Influences from websites
" https://jesseleite.com/posts/2/its-dangerous-to-vim-alone-take-fzf
" https://github.com/junegunn/fzf.vim


" Edit files
nmap <silent> <Leader>evim :vsplit $MYVIMRC<CR>
nmap <silent> <Leader>ezsh :vsplit $HOME/.zshrc<CR>
nmap <silent> <Leader>eshh :vsplit $HOME/.ssh/config<CR>
nmap <silent> <Leader>etmux :vsplit $HOME/.tmux.conf<CR>

" Faster save/quit/close
nmap <silent> <Leader>w :update<CR> nmap <silent> <Leader>q :quit<CR>
nmap <silent> <Leader>c :bdelete<CR>
nmap <silent> <Leader>n :cnext<CR>
nmap <silent> <Leader>p :cprevious<CR>



" Cd to the current file's directory
nnoremap <Leader>. :cd %:p:h<CR>:pwd<CR>

" Move current window to the far left using full height
nmap <silent> <Leader>h <C-w>H
" Move current window to the far right using full height
nmap <silent> <Leader>l <C-w>L
" Move current window to the top using full width
nmap <silent> <Leader>k <C-w>K
" Move current window to the bottom using full width
nmap <silent> <Leader>j <C-w>J

" Create new vertical window
" nmap <silent> <Leader>nvw

" nmap <Leader>rps :NERDTree ~/Repos<CR>
" nmap <Leader>home :NERDTree ~/<CR>

" Reselect visual block after indent/outdent: http://vimbits.com/bits/20
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv

" Clear search
nmap <Leader>cs :noh<CR>
