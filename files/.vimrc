" Setting up Vundle, vim plugin manager
let plug_executable=expand('~/.vim/autoload/plug.vim')
if !filereadable(plug_executable)
    echo "Installing plug"
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'ervandew/supertab'

Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'thoughtbot/vim-rspec'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Fuzzymatch file loading thing
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'


" Use ctrl+direction to switch windows
Plug 'christoomey/vim-tmux-navigator'

Plug 'nanotech/jellybeans.vim'
Plug 'ntpeters/vim-better-whitespace'

Plug 'osyo-manga/vim-over'
call plug#end()

" Use PlugInstall to install these plugins
" Install plugins in the background
let plugins_dir=expand('~/.vim/plugged')
if !isdirectory(plugins_dir)
    echo "Installing plugins, reloading vim"
    silent PlugInstall
    silent source $HOME/.vimrc
endif

set nocompatible

" Leader
let mapleader = " "

set modeline
set modelines=5

set background=dark

set cindent
set smartindent
set autoindent
filetype indent on
set tabstop=2
set shiftwidth=2
set expandtab
"autocmd Filetype python setlocal expandtab nosmartindent
"autocmd Filetype python setlocal expandtab nosmartindent
autocmd Filetype html setlocal expandtab ts=2 sw=2

syntax on
colorscheme jellybeans
filetype indent plugin on
set showmatch

" visual outocomplete for command menu
set wildmenu

set laststatus=2 " Always show the statusline
set statusline=%M%h%y\ %t\ %F\ %p%%\ %l/%L\ %=[%{&ff},%{&ft}]\ [a=\%03.3b]\ [h=\%02.2B]\ [%l,%v]
set title titlelen=150 titlestring=%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)\ -\ %{v:servername}
set scrolloff=3
set showcmd
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode


"nnoremap / /\v
"vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

nnoremap <tab> %
vnoremap <tab> %

set wrap

"set viminfo='10,\"100,:20,%,n~/.viminfo

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

syntax enable
"colorscheme solarized

set rnu

"set colorcolumn=79

set synmaxcol=128

set mouse=a

" History
set nowritebackup
set history=10000
set noswapfile
set nobackup

" Use system clipboard
set clipboard=unnamed

" Splits
set splitright
set splitbelow

"Now I can use :E to go explorer mode, no nerdtree required
let g:netrw_liststyle=3

set rtp+=/usr/local/opt/fzf
noremap <c-p> :FZF<CR>
noremap <leader>t :Tags<CR>
"let $FZF_DEFAULT_COMMAND = 'ag --ignore ".git/*" --hidden -l -g ""'
noremap <leader>p :Ag<CR>

autocmd BufRead,BufNewFile *.es6 setfiletype javascript
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell
" EG.
"nnoremap <leader>d dd
