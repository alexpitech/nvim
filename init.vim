"
" Alex's Neovim Configuration
"

source C:\DevTools\XDG\nvim\basic.vim

"----   基本设置    ----------------------------------------------------------------

" Be iMproved
set nocompatible    " 非兼容模式

" Sets how many lines of history Vim has to remember
set history=1000                   " 设置历史记录条数   

" Enable filetype plugins
filetype on
filetype plugin on
filetype indent on

" Set minimal number of screen lines to keep above and below the cursor
set scrolloff=8

" Avoid garbled characters in Chinese language Windows OS
let $LANG='en'
set langmenu=en

" Turn on the Wild menu
"set wildmenu

set wildignore=*.o,*~,*.pyc
if has('win16') || has('win32') || has('win64')
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Always show current position
" set ruler

" Show line number
set number
set relativenumber
set cursorline      " 高亮当前行背景

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hidden

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set matchtime=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set timeoutlen=500

" Add a bit extra margin to the left
set foldcolumn=1

"----   Colors and Fonts    --------------------------------------------------

" Enable syntax highlighting
syntax enable

if has("termguicolors")
    set termguicolors
endif

set background=dark

" Set extra options when running in GUI mode
if has('gui_running') || has('nvim')
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
"set guifont=JetBrains\ Mono:h12:cANSI
set guifont=Inconsolata:h12:cANSI
"set guifont=YaHei\ Ubuntu\ Hybrid:h10
"set guifont=Consolas:h12:cANSI
"set guifont=Microsoft\ YaHei\ UI:h10
"set guifont=Inconsolata\ for\ Powerline:h12:cANSI
set guifontwide=Microsoft\ YaHei\ UI:h12

set fileformats=dos,unix,mac

try
    colorscheme solarized
catch
endtry

"----   Files, backups and undo

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowritebackup
set noswapfile

"----   Text, tab and indent related    --------------------------------------

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab = 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Linebreak on 100 characters
set linebreak
set textwidth=100

set autoindent
set smartindent
set wrap

" python executables for different plugins
let g:python_host_prog='C:\Users\XIAOJIE\AppData\Local\Programs\Python\Python37\python.exe'	  " Python 2
"let g:pythonhome='D:\denv\msys64\mingw64\bin'	  " Python 2
"let g:pythondll='D:\denv\msys64\mingw64\lib\libpython2.7.dll.a'




"----   vim-plug    ------------------------------------------------------------
if empty(glob('C:\DevTools\XDG\nvim\autoload\plug.vim'))
    silent !curl -fLo C:\DevTools\XDG\nvim\autoload\plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"----   Specify a directory for plugins BEGIN   --------------------------------
call plug#begin('C:\DevTools\XDG\nvim\plugged')

"----   可视化缩进  ------------------------------------------------------------
    Plug 'Yggdroot/indentLine'

"----   Code/Project navigation     --------------------------------------------
    Plug 'scrooloose/nerdtree'              " Project and file navigation
"    Plug 'majutsushi/tagbar'                " Class/module browser
"    Plug 'kien/ctrlp.vim'                   " Fast transitions on project files
"    Plug 'Shougo/unite.vim'
"    Plug 'Shougo/vimfiler.vim'

"----   Languages support   ----------------------------------------------------
    Plug 'octol/vim-cpp-enhanced-highlight'

"----   Version control     ----------------------------------------------------
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'

"---    状态栏  ----------------------------------------------------------------
    Plug 'vim-airline/vim-airline'          " Lean & mean status/tabline for vim
    Plug 'vim-airline/vim-airline-themes'   " Themes for airline
    Plug 'flazz/vim-colorschemes'           " Colorschemes

"---    COC     ----------------------------------------------------------------
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

"----   彩虹括号    ------------------------------------------------------------
    Plug 'luochen1990/rainbow'

"----   Initialize plugin system END -------------------------------------------
call plug#end()

"----   可视化缩进  ------------------------------------------------------------
let g:indent_guides_guide_size            = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level           = 2  " 从第二层开始可视化显示缩进

"----   Code/Project navigation     --------------------------------------------
let g:NERDTreeWinSize = 25                      " 设定 NERDTree 视窗大小
nnoremap <F3> :NERDTreeToggle<CR>               " 开启/关闭nerdtree快捷键

"----   彩虹括号    ------------------------------------------------------------
    let g:rainbow_active=1

"---    状态栏 Airline  --------------------------------------------------------
"   gt 切换到下一个 tab 。也可以用命令:tabnext, :tabprew, :tabclose 等。
"   buffer 自带的 buffer 管理
"   :ls 列出所有已打开的 buffer
"   :b 数字 切换到对应 buffer
"   :bd 数字 删除对应 buffer

    set laststatus=2                    "永远显示状态栏
    let g:airline_theme="badwolf"

    " unicode symbols
"    let g:airline_left_sep = '»'
"    let g:airline_left_sep = '▶'
"    let g:airline_right_sep = '«'
"    let g:airline_right_sep = '◀'
"    let g:airline_symbols.crypt = '🔒'
"    let g:airline_symbols.linenr = '☰'
"    let g:airline_symbols.linenr = '␊'
"    let g:airline_symbols.linenr = '␤'
"    let g:airline_symbols.linenr = '¶'
"    let g:airline_symbols.maxlinenr = ''
"    let g:airline_symbols.maxlinenr = '㏑'
"    let g:airline_symbols.branch = '⎇'
"    let g:airline_symbols.paste = 'ρ'
"    let g:airline_symbols.paste = 'Þ'
"    let g:airline_symbols.paste = '∥'
"    let g:airline_symbols.spell = 'Ꞩ'
"    let g:airline_symbols.notexists = 'Ɇ'
"    let g:airline_symbols.whitespace = 'Ξ'


"
    let g:aireline#extension#tabline#enabled=1

