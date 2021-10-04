""""""""""""""""""""""""""""""""""""""""""""""""""""""
"      _  _ _                   _           _        "
"   __| |(_|_)_ __  _ __   __ _| | _____  _(_) ___   "
"  / _` || | | '_ \| '_ \ / _` | |/ _ \ \/ / |/ _ \  "
" | (_| || | | | | | | | | (_| | |  __/>  <| | (_) | "
"  \__,_|/ |_|_| |_|_| |_|\__,_|_|\___/_/\_\_|\___/  "
"      |__/                                          "
"                                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""

" This is my Nvim configuration for Linux.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype off                                            " we don't want it on before loading the plugins

call plug#begin('~/.config/nvim/plugged')

" status bar
Plug 'vim-airline/vim-airline' |
    \ Plug 'vim-airline/vim-airline-themes'

" highlight yanked area
Plug 'machakann/vim-highlightedyank'

" git plugins
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

" themes
Plug 'morhetz/gruvbox'
Plug 'wadackel/vim-dogrun'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'rigellute/shades-of-purple.vim'
Plug 'dracula/vim'

" file explorer & icons & highlighting | use fonts from https://www.nerdfonts.com/font-download
Plug 'preservim/nerdtree' | 
    \ Plug 'tiagofumo/vim-nerdtree-syntax-highlight' |
    \ Plug 'PhilRunninger/nerdtree-visual-selection' |
    \ Plug 'Xuyuanp/nerdtree-git-plugin' |
    \ Plug 'ryanoasis/vim-devicons'

" comments
Plug 'tpope/vim-commentary'

" Initialize plugin system
call plug#end()



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" General 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible			            " don't attempt to be compatible with vi/vim
set clipboard+=unnamedplus              " using system clipboard
" set confirm                             " ask for confirmation when saving
set hidden                              " Required to keep multiple buffers open multiple buffers
set updatetime=300                      " Faster completion
set timeoutlen=1500                     " timeout on default shortcuts (ms)
" set notimeout                           " ... or get rid of the timeout on custom shortcuts
set encoding=UTF-8                      " set the default encoding



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Search
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch                            " highlight search
set incsearch                           " increamental search
set ignorecase                          " search is case insensitive
set smartcase                           " ... becomes sensitive if an uppercase letter is entered

" set wildmode=longest,list               " get bash-like tab completions
set wildignore=*.swp,*.bak,*.pyc,*.class    " things to exclude from completion



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Format
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4                           " number of columns occupied by a tab
set softtabstop=4                       " see multiple spaces as tabstops so <BS> does the right thing
set shiftwidth=4                        " width for autoindents
set smarttab                            " detects what length of tabs is being used
set expandtab                           " converts tabs to spaces
set smartindent                         " detects what indents are needed
set autoindent                          " indent a new line the same amount as the line just typed



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Visual
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on                               " syntax highlighting
set title                               " have the name of the file as window title
set number                              " shows lines numbers on the left
set relativenumber                      " display numbers away from current line
set showtabline=2		                " Always show tabs
set noshowmode			                " We don't need to see things like -- INSERT -- anymore
set cursorline                          " highlight current cursorline
set cc=80                               " set an 80 column border
set splitbelow                          " Horizontal split below current
set splitright                          " Vertical split to right of current
set scrolloff=10                        " rows above/below cursor while scrolling
set sidescrolloff=5                     " columns to left/right of cursor while scrolling
set showmatch                           " Show matching brackets
set nowrap                              " Display long lines as just one line
set pumheight=10                        " Makes popup menu smaller
colorscheme dracula                     " set color scheme
set background=dark


"disable vim background to preserve terminal transparency
hi Normal guibg=NONE ctermbg=NONE        



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Swap & Backup 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:enableswap = 1                    " enable the use of swap files when editing
let g:enablebackup = 0                  " enable backups of files (not recommended for coc)
let g:enablesavedundo = 1               " enable undoing changes even after a file was saved

" those options may not be that useful when VCS is present

if enableswap
    silent !mkdir -p ~/.local/share/nvim/swap
    " create a swap directory if it doesn't exist
    set directory=~/.local/share/nvim/swap//        " make it the default location
else
    set noswapfile                                  " disable swapfiles
endif

if enablebackup
    silent !mkdir -p ~/.local/share/nvim/backup
    " create a backup directory if it doesn't exist
    set directory=~/.local/share/nvim/backup//      " make it the default location
else
    set nobackup                        	        " disable backups
    set nowritebackup
endif

if enablesavedundo
    silent !mkdir -p ~/.local/share/nvim/changes
    " create an undo directory if it doesn't exist
    set undodir=~/.local/share/nvim/changes//       " make it the default location
    set undofile                                    " enable saved undos
    set undoreload=10000
endif



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Plugin Configurations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    """""""""""""
    " vim-airline
    """""""""""""

" enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" enable powerline fonts
let g:airline_powerline_fonts = 1
" let g:airline_left_sep = ''
" let g:airline_right_sep = ''

" Switch to your current theme
let g:airline_theme = 'violet'


    """"""""""
    " nerdtree
    """"""""""

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Show hidden files
let NERDTreeShowHidden=1


    """""""""""""""""""""""""""""""
    " vim-nerdtree-syntax-highlight
    """""""""""""""""""""""""""""""

let g:NERDTreeLimitedSyntax = 1
" limits the highlight syntax to this types:
" .bmp, .c, .coffee, .cpp, .cs, .css, .erb, .go, .hs, .html, .java, .jpg, .js,
" .json, .jsx, .less, .lua, .markdown, .md, .php, .png, .pl, .py, .rb, .rs,
" .scala, .scss, .sh, .sql, .vim


    """""""""""""""""""""
    " nerdtree-git-plugin 
    """""""""""""""""""""

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

let g:NERDTreeGitStatusConcealBrackets = 1      " hide the boring brackets
let g:NERDTreeGitStatusUseNerdFonts = 1         " use nerdfonts


    """"""""""""""
    " vmachakann/highlightedyank
    """"""""""""""

let g:highlightedyank_highlight_duration = 1000


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Key Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Mapping tips
"
" Vim/Nvim is a modal editor. Each mode has its own shortcuts:
"
" n  Normal mode
" i  Insert mode
" v  Visual and select mode
" x  Visual mode
" s  Select mode
" c  Command-line mode
" o  Operator pending mode
"
" :<letter><command>    (use the command for that mode)
"
" :map                  (displays all shortcuts)
" 
" :map <key> ...        (maps a key to a shorcut or any other shortcut the sequence is mapped to)
" :noremap <key> ...    (maps a key to a sequence non-recursively. Shortcuts the sequence is linked to are not triggered)
"
" :unmap                (unmaps a key of all shortcuts)
" :nnremap <key> <nop>  (disables an internal shortcut to make the key usuable for a custom shortcut)
"
" :mapclear             (clears all shortcuts)



" Leader key
let mapleader = "\<space>"                      " set leader key for shortcuts
nnoremap <space> <nop>

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" Alternative to Escape key
inoremap jk <Esc>
inoremap kj <Esc>      

" Alternate way to save
nnoremap <C-s> :w<CR>

" Alternate way to save & quit
nnoremap <C-Q> :wq!<CR>

" Alternate way to close current buffer
nnoremap <C-w> :bd<CR>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" git status
nmap <leader>gs :G<CR>
" when resolving conflict, choose the left option
nmap <leader>gf :diffget //2<CR>
" when resolving conflict, choose the right option
nmap <leader>gj :diffget //3<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au! BufWritePost $MYVIMRC source %      " this file is automatically sourced when saved
