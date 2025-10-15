"""----- 基础配置 -----"""

""" 全局配置
let g:mapleader = ' '

""" 编码相关
set encoding=utf-8
scriptencoding utf-8

" 自动判断编码时，依次尝试以下编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileformats=unix,mac,dos

set helplang=cn

" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m
" 合并两行中文时，不在中间加空格
set formatoptions+=B

""" 文件类型
filetype on
filetype plugin on
filetype plugin indent on
set wildignore=*.swp,*.bak,*.pyc,*.class,.svn

""" 显示类
set shortmess=atI
set number
" set relativenumber
" 取消换行
" set nowrap
set showcmd

" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=10

" 设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制
" set t_ti= t_te=

""" 缩进
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

""" 折叠
set foldmethod=syntax
set foldlevel=99

""" 搜索匹配语法高亮等
syntax on
" 当光标置于成对符号（例如括号）时，高亮匹配的符号对
set showmatch

set hlsearch
set ignorecase
set smartcase
exec 'nohlsearch'

" For regular expressions turn magic on
set magic

""" 特性
" 去掉vi兼容性（set nocp）
" set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set mouse-=a

" 开启增强模式(vim默认off，nvim默认on)
set wildmenu

""" 文件读写
" 共享外部剪贴板
if !has("wsl")
    set clipboard^=unnamed,unnamedplus
endif

" 切换缓冲区前自动保存文件
set hidden

" 自动重新读入
set autoread

set autowrite
"set autowriteall

" 非粘贴模式，避免自动缩进
" set nopaste

" 备份和缓存
"set backup
"set backupdir=/tmp/vimbak/
set nobackup
set nowritebackup
set noswapfile

" 自动改变当前目录
"set autochdir

""" 自动补全相关
" 让Vim的补全菜单行为与一般IDE一致
set completeopt=longest,menu,preview

" " 回车即选中当前项
" inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

" " 上下左右键的行为 会显示其他信息
" inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
" inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
" inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
" inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

augroup complete_group
    au!

    " 离开插入模式后自动关闭预览窗口
    autocmd InsertLeave * if pumvisible() == 0 | pclose | endif

    " " In the quickfix window, <CR> is used to jump to the error under the cursor, so undefine the mapping there.
    " autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
    " " quickfix window  s/v to open in split window,  ,gd/,jd => quickfix window => open it
    " autocmd BufReadPost quickfix nnoremap <buffer> v <C-w><Enter><C-w>L
    " autocmd BufReadPost quickfix nnoremap <buffer> s <C-w><Enter><C-w>K

    " " command-line window
    " autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>
augroup end

""" haskellmod
let g:haddock_browser="w3m"
let g:haddock_browser_callformat="%s file://%s >/dev/null 2>&1 &"
