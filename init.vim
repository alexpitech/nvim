"
" Alex's Neovim Configuration
"

source $XDG_CONFIG_HOME\nvim\basic.vim

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
set fileformats=dos,unix,mac

"set guifont=JetBrains\ Mono:h12:cANSI
"set guifont=YaHei\ Ubuntu\ Hybrid:h10
"set guifont=Consolas:h12:cANSI
"set guifont=Microsoft\ YaHei\ UI:h10
"set guifont=Inconsolata\ for\ Powerline:h12:cANSI
set guifont=Inconsolata:h11:cANSI
set guifontwide=Microsoft\ YaHei\ UI:h11

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
set textwidth=200

set autoindent
set smartindent
set wrap

" python executables for different plugins
let g:python_host_prog='C:\Python27\python.exe'      " Python 2
let g:python_host_prog='C:\Users\XIAOJIE\AppData\Local\Programs\Python\Python37\python.exe'      " Python 3
"let g:pythonhome='D:\denv\msys64\mingw64\bin'      " Python 2
"let g:pythondll='D:\denv\msys64\mingw64\lib\libpython2.7.dll.a'



"-------------------------------------------------------------------------------
"   vim-plug
"-------------------------------------------------------------------------------
if empty(glob('$XDG_CONFIG_HOME\nvim\autoload\plug.vim'))
    silent !curl -fLo %XDG_CONFIG_HOME%\nvim\autoload\plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"----   Specify a directory for plugins BEGIN   --------------------------------
call plug#begin('$XDG_CONFIG_HOME\nvim\plugged')

"----   可视化缩进  ------------------------------------------------------------
    Plug 'Yggdroot/indentLine'

"----   Code/Project navigation     --------------------------------------------
    Plug 'scrooloose/nerdtree'              " Project and file navigation
"    Plug 'majutsushi/tagbar'                " Class/module browser
    Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }  " Nead visual-cpp-build-tools
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

"----   set my leader   --------------------------------------------------------
let mapleader="\<Space>"
let g:mapleader="\<Space>"

"----   可视化缩进  ------------------------------------------------------------
let g:indent_guides_guide_size            = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level           = 2  " 从第二层开始可视化显示缩进

"----   Code/Project navigation     --------------------------------------------
"
" NERDTree
"
    let g:NERDTreeWinSize = 25                      " 设定 NERDTree 视窗大小
    nnoremap <F3> :NERDTreeToggle<CR>               " 开启/关闭nerdtree快捷键
"
" TagBar
"
    map <leader>g :TagbarToggle<CR>

"---    状态栏 Airline  --------------------------------------------------------
"   gt 切换到下一个 tab 。也可以用命令:tabnext, :tabprew, :tabclose 等。
"   buffer 自带的 buffer 管理
"   :ls 列出所有已打开的 buffer
"   :b 数字 切换到对应 buffer
"   :bd 数字 删除对应 buffer

" status line
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    set laststatus=2                    " 永远显示状态栏

"    let g:airline_powerline_fonts = 1
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

    " powerline symbols
"    let g:airline_left_sep = ''
"    let g:airline_left_alt_sep = ''
"    let g:airline_right_sep = ''
"    let g:airline_right_alt_sep = ''
"    let g:airline_symbols.branch = ''
"    let g:airline_symbols.readonly = ''
"    let g:airline_symbols.linenr = '☰'
"    let g:airline_symbols.maxlinenr = ''
"    let g:airline_symbols.dirty='⚡'

    " old vim-powerline symbols
"    let g:airline_left_sep = '⮀'
"    let g:airline_left_alt_sep = '⮁'
"    let g:airline_right_sep = '⮂'
"    let g:airline_right_alt_sep = '⮃'
"    let g:airline_symbols.branch = '⭠'
"    let g:airline_symbols.readonly = '⭤'
"    let g:airline_symbols.linenr = '⭡'

" theme
    let g:airline_theme="badwolf"
"    let g:airline_theme='dark'

" tabline
    let g:airline#extensions#tabline#show_close_button = 0
    let g:airline#extensions#tabline#buffer_nr_show = 1
    let g:airline#extensions#tabline#enabled = 1        " 开启tabline
    let g:airline#extensions#tabline#tab_nr_type = 1    " tab number
    let g:airline#extensions#tabline#show_tab_nr = 1
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
    let g:airline#extensions#tabline#formatter = 'default'
    let g:airline#extensions#tabline#fnametruncate = 16
    let g:airline#extensions#tabline#fnamecollapse = 2
    let g:airline#extensions#tabline#buffer_idx_mode = 1
    let g:airline#extensions#tagbar#enabled = 1
    let g:airline#extensions#tabline#show_tabs = 1
    let g:airline#extensions#tabline#show_buffers = 1

"    " tab or buf 1
"    nnoremap <leader>1 :call te#utils#tab_buf_switch(1)<cr>
"    " tab or buf 2
"    nnoremap <leader>2 :call te#utils#tab_buf_switch(2)<cr>
"    " tab or buf 3
"    nnoremap  <leader>3 :call te#utils#tab_buf_switch(3)<cr>
"    " tab or buf 4
"    nnoremap  <leader>4 :call te#utils#tab_buf_switch(4)<cr>
"    " tab or buf 5
"    nnoremap  <leader>5 :call te#utils#tab_buf_switch(5)<cr>
"    " tab or buf 6
"    nnoremap  <leader>6 :call te#utils#tab_buf_switch(6)<cr>
"    " tab or buf 7
"    nnoremap  <leader>7 :call te#utils#tab_buf_switch(7)<cr>
"    " tab or buf 8
"    nnoremap  <leader>8 :call te#utils#tab_buf_switch(8)<cr>
"    " tab or buf 9
"    nnoremap  <leader>9 :call te#utils#tab_buf_switch(9)<cr>

" tabs
    nmap <leader>tw :tabnew<CR>
    nmap <leader>te :tabedit<Space>
    nmap <leader>tc :tabclose<CR>
    nmap <leader>tm :tabmove
    nmap <leader>tp :tabprevious<cr>
    nmap <leader>tn :tabnext<cr>

" window split
    nmap <leader>wh :split<cr>
    nmap <leader>wv :vsplit<cr>

"----   彩虹括号    ------------------------------------------------------------
    let g:rainbow_active=1

"----   切换函数    ------------------------------------------------------------
"    function! te#utils#tab_buf_switch(num) abort
"        if exists('g:feat_enable_airline') && g:feat_enable_airline == 1
"            execute 'normal '."\<Plug>AirlineSelectTab".a:num
"        else
"            if exists( '*tabpagenr' ) && tabpagenr('$') != 1
"                " Tab support && tabs open
"                execute 'normal '.a:num.'gt'
"            else
"                let l:temp=a:num
"                let l:buf_index=a:num
"                let l:buf_count=len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
"                if l:temp > l:buf_count
"                    return
"                endif
"                while l:buf_index != 0
"                    while !buflisted(l:temp)
"                        let l:temp += 1
"                    endw
"                    let l:buf_index -= 1
"                    if l:buf_index != 0
"                        let l:temp += 1
"                    endif
"                endw
"                execute ':'.l:temp.'b'
"            endif
"        endif
"    endfunction

