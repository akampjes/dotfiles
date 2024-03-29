" Setting up Vundle, vim plugin manager
"let plug_executable=expand('~/.vim/autoload/plug.vim')
"if !filereadable(plug_executable)
"    echo "Installing plug"
"    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"endif

call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'ervandew/supertab'

Plug 'elixir-editors/vim-elixir'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'thoughtbot/vim-rspec'

Plug 'sheerun/vim-polyglot'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Fuzzymatch file loading thing
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Adds ag and ack
Plug 'mileszs/ack.vim'

Plug 'dyng/ctrlsf.vim'

" Use ctrl+direction to switch windows
Plug 'christoomey/vim-tmux-navigator'

Plug 'nanotech/jellybeans.vim'
Plug 'ntpeters/vim-better-whitespace'

Plug 'osyo-manga/vim-over'

Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
call plug#end()

" Use PlugInstall to install these plugins
" Install plugins in the background
"let plugins_dir=expand('~/.vim/plugged')
"if !isdirectory(plugins_dir)
"    echo "Installing plugins, reloading vim"
"    silent PlugInstall
"    silent source $HOME/.vimrc
"endif

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
"autocmd Filetype tsv setlocal noexpandtab number tabstop=20 softtabstop=20 shiftwidth=20 nowildmenu
autocmd BufEnter *.tsv setlocal noexpandtab ts=20 sts=20 sw=20
au BufRead,BufNewFile *.md setlocal textwidth=80

syntax on
"colorscheme jellybeans
filetype indent plugin on
set showmatch


set list
"set listchars=tab:>-
set listchars=tab:\ \ ,nbsp:_
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
set clipboard+=unnamedplus

" Splits
set splitright
set splitbelow

set rtp+=/usr/local/opt/fzf
noremap <c-p> :FZF<CR>
noremap <leader>t :Tags<CR>
"let $FZF_DEFAULT_COMMAND = 'ag --ignore ".git/*" --hidden -l -g ""'
noremap <leader>p :Ag<CR>

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)

nmap ; :Buffers<CR>

nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

autocmd BufRead,BufNewFile *.es6 setfiletype javascript
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell
" EG.
"nnoremap <leader>d dd
