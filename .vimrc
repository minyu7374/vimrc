" 先设置好 <Leader>
let mapleader = ","
let g:mapleader = ","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件管理及其相关配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'majutsushi/tagbar'
Plug 'christoomey/vim-tmux-navigator'

Plug 'easymotion/vim-easymotion'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

" Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'fatih/vim-go', { 'for': 'go' , 'do': ':GoInstallBinaries' }
Plug 'stamblerre/gocode', { 'for': 'go', 'rtp': 'vim/', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }

Plug 'craigemery/vim-autotag'

" Plug 'StanAngeloff/php.vim', { 'for': 'php' }
" Plug 'arnaud-lb/vim-php-namespace', { 'for': 'php' }
" Plug 'shawncplus/phpcomplete.vim', { 'for': 'php' }
" Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }

Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
" Plug 'ekalinin/Dockerfile.vim', {'for' : 'Dockerfile'}
Plug 'elzr/vim-json', { 'for' : 'json' }
Plug 'fatih/vim-nginx' , { 'for' : 'nginx' }

" 缩进指示线(python用，其他语言没必要)
Plug 'Yggdroot/indentLine', { 'for': 'python' }

" Plug 'SirVer/ultisnips', { 'on': [] }
" Plug 'SirVer/ultisnips'
" Plug 'Valloric/YouCompleteMe',  { 'do': './install.py --clang-completer --go-completer --ts-completer --ninja', 'on': [] }
" Plug 'Valloric/YouCompleteMe',  { 'do': './install.py --clang-completer --go-completer --ts-completer', 'on': [] }
Plug 'Valloric/YouCompleteMe',  { 'do': 'python3 ./install.py --clang-completer --go-completer --ts-completer' }
Plug 'Valloric/ListToggle'
" Plug 'zxqfl/tabnine-vim'

" Plug 'Yggdroot/indentLine'
Plug 'Chiel92/vim-autoformat'
Plug 'jiangmiao/auto-pairs'
" Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdcommenter'
"for text filtering and alignment
Plug 'godlygeek/tabular'

" git
Plug 'tpope/vim-fugitive'

" 前端
Plug 'mattn/emmet-vim', { 'for': 'html' }
" Plug 'othree/html5.vim'

Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
" Plug 'groenewege/vim-les'

Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
" Plug 'kchmck/vim-coffee-scipt'
" Plug 'leafgarland/typescript-vim'

" JavaScript 补全
Plug 'ternjs/tern_for_vim', { 'for': 'javascript' }

" 色彩高亮，例子: #77DCFF
Plug 'gorodinskiy/vim-coloresque'

" 语法检查
"Plug 'scrooloose/syntastic'
"Plug 'vim-syntasticu/syntastic'
" 异步并发检查
Plug 'w0rp/ale'

" Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'
" Plug 'tyrannicaltoucan/vim-quantum'
" Plug 'flazz/vim-colorschemes'

" Plug 'Lokaltog/vim-powerline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'junegunn/vim-emoji'

Plug 'jceb/vim-orgmode'

" grammar checker
" Plug 'dpelle/vim-LanguageTool'

" augroup load_us_ycm
" autocmd!
" autocmd InsertEnter * call plug#load('ultisnips', 'YouCompleteMe')
" \| autocmd! load_us_ycm
" augroup END

call plug#end()

" filetype  plugin indent on
" syntax enable

" tags
let g:autotagTagsFile="./.tags.append"
set tags+=./.tags,./.tags.append

" 自动补全相关
" 让Vim的补全菜单行为与一般IDE一致
set completeopt=longest,menu,preview
" 离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" 回车即选中当前项
" inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'

let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0

let g:ycm_autoclose_preview_window_after_completion=1

let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <leader>gd :YcmDiags<CR>

" let g:ycm_filetype_specific_completion_to_disable = { 'python' : 1 }
" let g:ycm_filetype_blacklist = { 'python' : 1 }

" let g:EclimCompletionMethod = 'omnifunc'
" let g:EclimFileTypeValidate = 0
" vim-autoformat
noremap <leader>af :Autoformat<CR>
" autocmd FileType c,cpp,java,go,php,haskell,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :Autoformat
" autocmd FileType c,cpp,java,go,php,haskell,javascript,puppet,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :Autoformat
" au BufWrite * :Autoformat
let g:autoformat_verbosemode=0
" let g:autoformat_autoindent = 0
" let g:autoformat_retab = 0
" let g:autoformat_remove_trailing_spaces = 0

" youcompleteme 扩展php
" autocmd FileType php set omnifunc=phpcomplete#CompletePHP
" autocmd FileType php set completefunc=phpcomplete#CompletePHP

" jedi python 版本
" let g:jedi#force_py_version = 3
" autocmd FileType python nnoremap <leader>j2 :let g:jedi#force_py_version = 2<CR>
" autocmd FileType python nnoremap <leader>j3 :let g:jedi#force_py_version = 3<CR>

" pip install flake8 没用flake8之前，检查不了未定义变量; 而且python版本jedi强制设置成2,还是会提示print错误
" let g:syntastic_python_checkers=['flake8', ]
" pep8 的检查过于烦人, 而且和yapf有冲突(比如行长79和80)，忽略掉. 单独写了yapf格式化的键盘映射
"let g:syntastic_python_flake8_args='--ignore=E501,E225'
" let g:syntastic_python_flake8_args='--ignore=E501,E225,E124,E712,E116,E131,E402,E401'

""" w0rp/ale 相关 """
" always normal insert never
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1
" no linters to run on opening a file
let g:ale_lint_on_enter = 0
" use the quickfix list or the loclist
" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 1
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
" show Vim windows for the loclist or quickfix items when a file contains warnings or errors
let g:ale_open_list = 1
" keep the window open even after errors disappear
"let g:ale_keep_list_window_open = 1
"let g:ale_enabled = 0
" 始终开启标志列设置
" let g:ale_sign_column_always = 1
" 指定启用的linters
" c         cppcheck, cpplint, gcc, clang, clangtidy!!, clang-format
" cpp       clang, clangcheck!!, clangtidy!!, cppcheck, cpplint!!, gcc, clang-format
" haskell   ghc, stack-ghc, stack-build !!, ghc-mod, stack-ghc-mod, hlint, hdevtools
" go        gofmt, go vet, golint, gometalinter !!, go build!!, gosimple, staticcheck
" html      HTMLHint, proselint, tidy
" Python    autopep8, flake8, isort, mypy, pycodestyle, pylint!!, yapf
" gometalinter(golint) 对命名规范限制的太死, 变量名、函数名、常数都要用驼峰命名法
"\  'go': 'all',
" 据说比golint快两倍，且可以更灵活地自定义规范
" 已写入ale/ale_linters/go/revive.vim
" call ale#linter#Define('go', {
" \   'name': 'revive',
" \   'output_stream': 'both',
" \   'executable': 'revive',
" \   'read_buffer': 0,
" \   'command': 'revive %t',
" \   'callback': 'ale#handlers#unix#HandleAsWarning',
" \})
" \  'go': ['gofmt', 'revive', 'go build'],

let g:ale_linters = {
            \  'c': ['clang'],
            \  'cpp': ['clang'],
            \  'go': ['gopls'],
            \  'php': ['php -l'],
            \  'sh': ['shellcheck'],
            \  'bash': ['shellcheck'],
            \  'awk': ['gawk'],
            \  'lua': ['luacheck'],
            \  'sql': ['sqlint'],
            \  'python': ['flake8'],
            \  'markdown': ['mdl'],
            \  'vim': ['vint'],
            \  'html': [],
            \  'txt': [],
            \}
" 针对python的设置
let g:ale_python_flake8_executable = 'python3'
autocmd FileType python nnoremap <leader>p2 :let g:ale_python_flake8_executable = 'python2'<CR>
autocmd FileType python nnoremap <leader>p3 :let g:ale_python_flake8_executable = 'python3'<CR>
" 理由同 syntastic_python_flake8_args的设置(https://pep8.readthedocs.io/en/release-1.7.x/intro.html#error-codes)
" let g:ale_python_flake8_options = '-m flake8 --ignore=E501,E225,E124,E712,E116,E131,E401,E402'
let g:ale_python_flake8_options = '-m flake8 --ignore=E501,E401,E402,E722'

" 使用自己的toml配置文件, 这样好像没作用，对revive做了alias
" let g:ale_go_revive_options = '-config ~/.revive/config.toml'

" 错误处高亮
" let g:ale_set_highlights = 0
let g:ale_set_highlights = 1
" If emoji not loaded, use default sign
" try
" "let g:ale_sign_error = emoji#for('boom')
" let g:ale_sign_error = emoji#for('eight_pointed_black_star')
" "let g:ale_sign_warning = emoji#for('small_orange_diamond')
" let g:ale_sign_warning = '•'
" catch
" " Use same sign and distinguish error and warning via different colors.
" let g:ale_sign_error = '✴'
" let g:ale_sign_warning = '•'
" "let g:ale_sign_error = '✹'
" "let g:ale_sign_warning = '⚠'
" endtry
let g:ale_sign_error = '✴'
let g:ale_sign_warning = '•'
"let g:ale_echo_msg_format = '[#%linter%#] %s [%severity%]'
"let g:ale_echo_msg_format = '%severity% [%linter%] %s'
let g:ale_echo_msg_format = '[%linter%] %severity% %s'
let g:ale_statusline_format = ['E•%d', 'W•%d', 'OK']

"highlight clear ALEErrorSign
"highlight clear ALEWarningSign

" For a more fancy ale statusline
function! ALEGetError()
    let l:res = ale#statusline#Status()
    if l:res ==# 'OK'
        return ''
    else
        let l:e_w = split(l:res)
        if len(l:e_w) == 2 || match(l:e_w, 'E') > -1
            return ' •' . matchstr(l:e_w[0], '\d\+') .' '
        endif
    endif
endfunction

function! ALEGetWarning()
    let l:res = ale#statusline#Status()
    if l:res ==# 'OK'
        return ''
    else
        let l:e_w = split(l:res)
        if len(l:e_w) == 2
            return ' •' . matchstr(l:e_w[1], '\d\+')
        elseif match(l:e_w, 'W') > -1
            return ' •' . matchstr(l:e_w[0], '\d\+')
        endif
    endif
endfunction

"let g:ale_echo_msg_error_str = 'Error'
"let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_echo_msg_error_str = '✹'
let g:ale_echo_msg_warning_str = '⚠'

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

nmap <Leader>en <Plug>(ale_next)
nmap <Leader>ep <Plug>(ale_previous)
nnoremap <Leader>ts :ALEToggle<CR>
nnoremap <Leader>ah :let g:ale_sign_column_always=0<CR>
nnoremap <Leader>as :let g:ale_sign_column_always=1<CR>
nnoremap <Leader>aa :let g:ale_lint_on_text_changed='always'<CR>
nnoremap <Leader>an :let g:ale_lint_on_text_changed='never'<CR>

" vim-go
" let g:coc_global_extensions = get(g:, 'coc_global_extensions', ['coc-snippets', 'coc-pairs', 'coc-phpls', 'coc-eslint']) 
let g:go_fmt_command = "goimports" 
let g:go_def_mode="gopls"

" PHP
let g:php_namespace_sort_after_insert = 1

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>pu <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>pu :call PhpInsertUse()<CR>

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>pe <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>pe :call PhpExpandClass()<CR>

autocmd FileType php inoremap <Leader>ps <Esc>:call PhpSortUse()<CR>
autocmd FileType php noremap <Leader>ps :call PhpSortUse()<CR>

" markdown相关
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_math = 1
" restrict text emphasis to a single line
"let g:vim_markdown_emphasis_multiline = 0
"let g:vim_markdown_frontmatter = 1
" need vim-toml
"let g:vim_markdown_toml_frontmatter = 1
" need vim-json
"let g:vim_markdown_json_frontmatter = 1
"let g:vim_markdown_new_list_item_indent = 2

" java
" autocmd FileType java setlocal omnifunc=javacomplete#Complete

" NERDTree相关
map <leader>tr :NERDTreeToggle<CR>
map! <leader>tr <ESC>:NERDTreeToggle<CR>
"autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']

" Tagbar配置
map <leader>ti :TagbarToggle<CR>
map! <leader>ti <ESC>:TagbarToggle<CR>i
let g:tagbar_autofocus = 1

" split新窗口在当前窗口下面，这样像YouCompleteMe的preview window等窗口打开位置看着更舒服
set splitbelow

" 配色方案
set background=dark
" set background=light
set t_Co=256
colorscheme solarized
" colorscheme gruvbox
" colorscheme nightflight
" colorscheme inkpot
" colorscheme tender
" colorscheme molokai

" 以下是vim自带配色方案(/usr/share/vim/vim80/colors)
" blue darkblue default delek desert elflord evening industry koehler morning
" murphy pablo peachpuff README.txt ron shine slate torte zellner
"colorscheme desert

" solarized
let g:solarized_termcolors=256
let g:solarized_termtrans = 1
let g:solarized_degrade = 0
" let g:solarized_contrast = "high"
let g:solarized_contrast = "normal"
let g:solarized_visibility = "normal"

" let g:gruvbox_contrast_dark = "soft"

" molokai
" let g:molokai_original = 1

" 缩进指示线
" let g:indentLine_setColors = 0
" let g:indentLine_color_term = 239
" let g:indentLine_bgcolor_term = 202
" ¦, ┆, │, ⎸,  ▏
"let g:indentLine_char = '┆'
" let g:indentLine_enabled = 1

" 状态栏
let g:airline_theme = 'simple'
" let g:airline_theme = 'dark'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
"let g:airline#extensions#tabline#enabled = 1
" show absolute file path in status line
let g:airline_section_c = '%<%F%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'
" show tab number in tab line
let g:airline#extensions#tabline#tab_nr_type = 1

" 注释时自动加一个空格
let g:NERDSpaceDelims=1
" 取消注释后空行中的空格删除
" let g:NERDTrimTrailingWhitespace=1
" python 设置成0时就会有空格，设成1反而多了一个空格
autocmd FileType python :let g:NERDSpaceDelims=0

" tmux 相关
" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 1
" 自定义设置快捷键映射
" let g:tmux_navigator_no_mappings = 1
" nnoremap <silent> <leader>th :TmuxNavigateLeft<CR>
" nnoremap <silent> <leader>tj :TmuxNavigateDown<CR>
" nnoremap <silent> <leader>tk :TmuxNavigateUp<CR>
" nnoremap <silent> <leader>tl :TmuxNavigateRight<CR>
" nnoremap <silent> <leader>t\ :TmuxNavigatePrevious<CR>
" autocmd VimEnter * silent !tmux set -g status off
" autocmd VimLeave * silent !tmux set -g status on
" 设置tmux状态行开关
nnoremap <silent> <leader>tm :!tmux set -g status<CR><CR>

" easy_motion
let g:EasyMotion_smartcase = 1
" keep cursor colum when JK motion
"let g:EasyMotion_startofline = 0
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
map <Leader><leader>. <Plug>(easymotion-repeat)

" emoji completion
" set completefunc=emoji#complete

" languagetool_jar path for mac
" let g:languagetool_jar="/usr/local/Cellar/languagetool/5.4/libexec/languagetool-commandline.jar"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 常规配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" 修复Esc反应慢问题
" set ttimeoutlen=50
set noesckeys

" 语法高亮
syntax on

" 输入的命令显示出来
set showcmd

" 允许折叠
set foldenable
" 手动折叠
set foldmethod=manual
" 代码折叠
set foldmethod=marker

" 共享外部剪贴板
set clipboard+=unnamed

" 去掉vi兼容性（set nocp）
set nocompatible

" 自动缩进
set autoindent
set cindent
set smartindent

" Tab键的宽度
set tabstop=4

" 统一缩进为4
set softtabstop=4
set shiftwidth=4

" 缩进时取整
set shiftround

" 某些语言缩进常用为2
" autocmd FileType ruby,javascript,html,css,xml set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai

" 用空格代替制表符
set expandtab

" 在行和段开始处使用制表符 需要输入真正的Tab键时，使用 Ctrl+V + Tab
set smarttab

" 制表符
set iskeyword+=_,$,@,%,#,-

" change terminal's title
set title

" b:<BS> s:<Space> h, l <:<Left> >:<Right>
"set whichwrap+=<,>,h,l

" 显示行号
"set number
" 标尺
"set ruler

" 现在使用插件控制了
" 命令行于状态行
"set ch=1
" 始终显示状态行
"set ls=2

" 高亮当前行列
"set cursorline "set cul
"set cursorcolumn "set cuc
" highlight CursorLine   cterm=NONE ctermbg=NONE ctermfg=DarkCyan guibg=NONE guifg=NONE
" highlight CursorColumn cterm=NONE ctermbg=NONE ctermfg=DarkCyan guibg=NONE guifg=NONE
" DarkMagenta Black DarkBlue DarkGreen DarkCyan DarkRed DarkMagenta Brown,
"DarkYellow LightGray, LightGrey, Gray, Grey DarkGray, DarkGrey Blue, LightBlue
" highlight CursorLine   cterm=NONE ctermbg=NONE ctermfg=DarkMagenta guibg=NONE guifg=NONE
" highlight CursorLine   cterm=NONE ctermbg=NONE ctermfg=LightGreen guibg=NONE guifg=NONE
highlight CursorLine   cterm=NONE ctermbg=NONE ctermfg=LightBlue guibg=NONE guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=NONE ctermfg=LightBlue guibg=NONE guifg=NONE

" python为方便标记第80列(pep8规范)
autocmd FileType python :set colorcolumn=80
autocmd FileType python :highlight ColorColumn ctermbg=Black
" autocmd FileType python :highlight ColorColumn ctermbg=DarkGray

"set tw=79   " width of document (used by gd)
"set nowrap  " don't automatically wrap on load
"set fo-=t   " don't automatically wrap text when typing

" 历史记录数
"set history=500

" 自动重新读入
set autoread

set autowrite
"set autowriteall

" 备份和缓存
"set backup
"set backupdir=/tmp/vimbak/
set nobackup
set nowritebackup
set noswapfile

" 设定在任何模式下鼠标都可用
"set mouse=a
"set mouse=v
set mouse=
set mousehide

" 自动改变当前目录
"set autochdir

" 搜索逐字符高亮
set hlsearch
set incsearch

" 搜索忽略大小写
" set ignorecase
set smartcase

set magic
" 行内替换 s/// gg:all g:one
"set gdefault

" 编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8

" 语言设置
"set langmenu=en_US.UTF-8
"set langmenu=zh_CN.UTF-8
"set helplang=cn

" 去掉启动时提示
set shortmess=atI

" 退出vim后，内容显示在终端屏幕, 好处：误删什么的，如果以前屏幕打开，可以找回...
"set t_ti= t_te=

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自定义按键映射
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 将;映射成: 不用按shift了(避免手残,变成切换中文,和输入中文的 ；)
map ; :

" 关闭方向键
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

imap <Left> <Nop>
imap <Right> <Nop>
imap <Up> <Nop>
imap <Down> <Nop>

" 调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv

" panel 相关
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-H> <C-W><C-H>
" nnoremap <C-L> <C-W><C-L>

nnoremap <leader>wj <C-W><C-J>
nnoremap <leader>wk <C-W><C-K>
nnoremap <leader>wh <C-W><C-H>
nnoremap <leader>wl <C-W><C-L>
nnoremap <leader>wv <C-w>v
nnoremap <leader>ws <C-w>s

" +- 本有上下行的功能，但平时都用JK, 这里不要了
nnoremap <silent> = :resize +3<CR>
nnoremap <silent> + :resize +3<CR>
nnoremap <silent> - :resize -3<CR>
nnoremap <silent> _ :resize +3<CR>
nnoremap <silent> > :vertical resize +5<CR>
nnoremap <silent> < :vertical resize -5<CR>
"nnoremap <silent> = :exe "resize " . (winheight(0) * 6/5)<CR>
"nnoremap <silent> + :exe "resize " . (winheight(0) * 6/5)<CR>
"nnoremap <silent> - :exe "resize " . (winheight(0) * 5/6)<CR>
"nnoremap <silent> _ :exe "resize " . (winheight(0) * 5/6)<CR>
"nnoremap <silent> > :exe "vertical resize " . (winwidth(0) * 6/5)<CR>
"nnoremap <silent> < :exe "vertical resize " . (winwidth(0) * 5/6)<CR>

" 去掉搜索高亮
noremap <silent><leader>/ :nohls<CR>

" 高亮当前单词，光标不跳转
nmap <silent><leader>* :set hls<CR> :let @/=expand('<cword>')<CR>
nmap <silent><leader># :set hls<CR> :let @/=expand('<cword>')<CR>

" 高亮当前行列的开关
map <leader>hc :set cuc!<CR>
map! <leader>hc <ESC>:set cuc!<CR>i
map <leader>hl :set cul!<CR>
map! <leader>hl <ESC>:set cul!<CR>i

" vimgrep相关
nmap <leader>vn :cnext<CR>
nmap <leader>vp :cprev<CR>

" quickfix 开关
nmap <leader>cw :cw<CR>
nmap <leader>qo :copen<CR>
nmap <leader>qc :cclose<CR>

" nmap <leader>em :set completefunc=emoji#complete<CR>
nmap <leader>yc :set completefunc=youcompleteme#CompleteFunc<CR>

" tabNext
map <S-Tab> :tabNext<CR>
map <S-T> :tabnew<CR>

" Leaderf
let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

noremap lfb :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap lfr :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fg :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fgd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fgo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fgn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fgp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>

nmap <unique> <leader>fr <Plug>LeaderfRgPrompt
nmap <unique> <leader>fra <Plug>LeaderfRgCwordLiteralNoBoundary
nmap <unique> <leader>frb <Plug>LeaderfRgCwordLiteralBoundary
nmap <unique> <leader>frc <Plug>LeaderfRgCwordRegexNoBoundary
nmap <unique> <leader>frd <Plug>LeaderfRgCwordRegexBoundary
vmap <unique> <leader>fra <Plug>LeaderfRgVisualLiteralNoBoundary
vmap <unique> <leader>frb <Plug>LeaderfRgVisualLiteralBoundary
vmap <unique> <leader>frc <Plug>LeaderfRgVisualRegexNoBoundary
vmap <unique> <leader>frd <Plug>LeaderfRgVisualRegexBoundary

" 启动paste模式，粘贴时不用担心自动缩进影响
" 其实可以直接用　"+p　
":set pastetoggle=<F3>
:set pastetoggle=<leader>ps

" 插入当前时间
map <leader>xt a<c-r>=strftime("%Y/%m/%d %H:%M")<cr><ESC>

" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y
"vmap <M-c> "+y
"vmap <A-c> "+y
"vmap <D-c> "+y

" 映射全选+复制 ctrl+A
map <C-A> ggVGY
map! <C-A> <Esc>ggVG

"" 编译运行调试相关 """
" C，C++ 按F5编译运行
map <leader>rr :call CompileRun()<CR>
map! <leader>rr <ESC>:call CompileRun()<CR>

func! CompileRun()
    exec "w"
    if &filetype == 'c'
        "exec '!gcc % -o %< ; if [ -f in ]; then ./%< < in > out; cat out; else ./%<; fi'
        exec '!gcc % -o %< ; if [ -f in ]; then time ./%< < in > out; cat out; else ./%<; fi; rm %<'
        "exec "!gcc % -o %< ; if [ -f in ]; then ./%< < in; else ./%<; fi; rm %<"
    elseif &filetype == 'cpp'
        "exec '!g++ % -o %< ; if [ -f in ]; then ./%< < in > out; cat out; else ./%<; fi'
        exec '!g++ % -o %< ; if [ -f in ]; then time ./%< < in > out; cat out; else ./%<; fi; rm %<'
        "exec "!g++ % -o %< ; if [ -f in ]; then ./%< < in; else ./%<; fi; rm %<"
    elseif &filetype == 'java'
        exec "!javac %; java %<"
    elseif &filetype == 'sh'
        :!chmod +x %; ./%
    elseif &filetype == 'go'
        :!go run %
    elseif &filetype == 'python'
        :!python2 %
    endif
    " exec "q"
endfunc

" C,C++的调试
map <leader>rg :call Rungdb()<CR>
map! <leader>rg <ESC>:call Rungdb()<CR>

func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
endfunc

" 针对C++11
map <leader>rp :call CompileRunGcc11()<CR>
map! <leader>rp <ESC>:call CompileRunGcc11()<CR>

func! CompileRunGcc11()
    if &filetype == 'cpp'
        exec "w"
        "exec '!g++ --std=c++11 -O2 % -o %<_c11 ; if [ -f in ]; then ./%<_c11 < in > out; cat out; else ./%<_c11; fi'
        exec '!g++ --std=c++11 -O2 % -o %<_c11 ; if [ -f in ]; then time ./%<_c11 < in > out; cat out; else ./%<_c11; fi; rm %<_c11'
        "exec '!g++ --std=c++11 % -o %<_c11 ; if [ -f in ]; then ./%<_c11 < in; else ./%<_c11; fi; rm %<_c11'
        exec "q"
    else
        call CompileRunGcc()
    endif
endfunc

" 临时最大化 pane. :only(<C-W>O)不等还原原来的分屏
nmap <leader>z :call Zoom()<CR>
function! Zoom ()
    " check if is the zoomed state (tabnumber > 1 && window == 1)
    if tabpagenr('$') > 1 && tabpagewinnr(tabpagenr(), '$') == 1
        let l:cur_winview = winsaveview()
        let l:cur_bufname = bufname('')
        tabclose

        " restore the view
        if l:cur_bufname == bufname('')
            call winrestview(cur_winview)
        endif
    else
        tab split
    endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自定义自动执行类操作
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au! BufNewFile,BufRead *.gtpl setf html
"autocmd FileType markdown autocmd BufRead,BufNewFile map <Leader>mp :!google-chrome-stable %<CR><CR>
autocmd BufRead,BufNewFile *.{html,htm} map <Leader>gc :!google-chrome-stable %<CR><CR>
autocmd BufRead,BufNewFile *.{md,MD,mdown,mkd,mkdn,markdown,mdwn} map <Leader>mg :!google-chrome-stable % &<CR><CR>
" autocmd BufRead,BufNewFile *.{md,MD,mdown,mkd,mkdn,markdown,mdwn} map <Leader>mm :!cd /opt/Moeditor && cnpm start %:p &<CR><CR>
autocmd BufRead,BufNewFile *.{md,MD,mdown,mkd,mkdn,markdown,mdwn} map <Leader>mt :!Typora % &<CR><CR>
"autocmd FileType python nnoremap <Leader>yf :!yapf --style google -i % <CR><CR>
" autocmd FileType python nnoremap <Leader>yf :0,$!yapf --style google<CR> "这样不太安全,但比较方便,如果报错,按U回退即可.
autocmd FileType python nnoremap <Leader>yf :0,$!yapf<CR> "这样不太安全,但比较方便,如果报错,按U回退即可.
autocmd FileType python nnoremap <Leader>bf :!black %<CR><CR>"
"autocmd FileType python vnoremap <leader>yf :!yapf --style google<CR>
autocmd FileType python nnoremap <Leader>is :!isort % <CR><CR>

"autocmd FileType python autocmd BufWritePre <buffer> :!yapf --style google -i % ; isort %

" 改用插件，毕竟个人定义的没人家想的全，对各种语言和场景的针对性不强
""   括弧的自动补全   """
" :inoremap ( ()<ESC>i
" :inoremap ) <c-r>=ClosePair(')')<CR>
" ":inoremap { {}<esc>i
" :inoremap { {<CR>}<esc>O
" :inoremap } <c-r>=ClosePair('}')<CR>
" :inoremap [ []<ESC>i
" :inoremap ] <c-r>=ClosePair(']')<CR>
" :inoremap " ""<ESC>i
" :inoremap ' ''<ESC>i

" function! ClosePair(char)
" if getline('.')[col('.') - 1] == a:char
" return "\<Right>"
" else
" return a:char
" endif
" endfunction

" " 保存代码时删除多余空格
" autocmd FileType c,cpp,java,go,php,haskell,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
" function! <SID>StripTrailingWhitespaces()
" let l = line(".")
" let c = col(".")
" %s/\s\+$//e
" call cursor(l, c)
" endfun

autocmd BufNewFile *.cpp,*.[ch],*.sh,*.hs,*.java,*.py,*.go,*.lua exec ":call SetTitle()"
" 定义函数SetTitle，自动插入文件头
"func SetTitle()
function! SetTitle()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        "call setline(1, "\#!/bin/bash")
        call setline(1, "\#!/usr/bin/env bash")
        call setline(2, "\#########################################################################")
        call setline(3, "\# File Name: ".expand("%"))
        call setline(4, "\# Author: minyu")
        " call setline(5, "\# mail: wmy0831988@163.com")
        call setline(5, "\# mail: minyu7374@gmail.com")
        call setline(6, "\# Created Time: ".strftime("%c"))
        call setline(7, "\#########################################################################")
        call setline(8, "")
    elseif &filetype == 'python'
        "call setline(1, "\#!/usr/bin/python")
        call setline(1, "\#!/usr/bin/env python")
        call setline(2, "\# -*- coding: utf-8 -*-")
        call setline(3, "\# File Name: ".expand("%"))
        call setline(4, "\# Created Time: ".strftime("%c"))
        call setline(5, "")
        call setline(6, "__author__ = 'minyu'")
        " call setline(7, "__mail__ = 'wmy0831988@163.com'")
        call setline(7, "__mail__ = 'minyu7374@gmail.com'")
        call setline(8, "")
    elseif &filetype == 'lua'
        call setline(1, "--[[")
        call setline(2, "-- File Name: ".expand("%"))
        call setline(3, "-- Author: minyu")
        call setline(4, "-- mail: minyu7374@gmail.com")
        call setline(5, "-- Created Time: ".strftime("%c"))
        call setline(6, "]]")
        call setline(7, "")
    elseif &filetype == 'haskell'
        call setline(1, "\#!/usr/bin/env runghc")
        call setline(2, "{-")
        call setline(3, "   File Name: ".expand("%"))
        call setline(4, "   Author: minyu")
        call setline(5, "   mail: minyu7374@gmail.com")
        call setline(6, "   Created Time: ".strftime("%c"))
        call setline(7, "-}")
        call setline(8, "")
    else
        call setline(1, "/*************************************************************************")
        call setline(2, "   > File Name: ".expand("%"))
        call setline(3, "   > Author: minyu")
        " call setline(4, "   > Mail: wmy0831988@163.com")
        call setline(4, "   > Mail: minyu7374@gmail.com")
        call setline(5, "   > Created Time: ".strftime("%c"))
        call setline(6, " ************************************************************************/")
        call setline(7, "")
    endif

    "    if &filetype == 'c'
    "        call setline(8,   "#include <stdio.h>")
    "        call setline(9,   "#include <stdlib.h>")
    "        call setline(10,   "#include <string.h>")
    "        call setline(11,   "")
    "        call setline(12,   "int main(){")
    "        call setline(13,  "")
    "        call setline(14,  "}")
    "    endif
    "
    """    if &filetype == 'cpp'
    "        "call setline(8,   "#include <bits/stdc++.h>")
    "        call setline(8,   "#include <cstdio>")
    "        call setline(9,   "#include <iostream>")
    "        call setline(10,  "#include <cstdlib>")
    "        call setline(11,  "#include <cstring>")
    "        call setline(12,  "#include <algorithm>")
    "        call setline(13,  "#include <cmath>")
    "        call setline(14,  "#include <string>")
    "        call setline(15,  "#include <vector>")
    "        call setline(16,  "#include <queue>")
    "        call setline(17,  "#include <set>")
    "        call setline(18,  "#include <map>")
    "        call setline(19,  "")
    "        call setline(20,  "using namespace std;")
    "        call setline(21,  "")
    "        call setline(22,  "int main(){")
    "        call setline(23,  "")
    "        call setline(24,  "    return 0;")
    "        call setline(25,  "}")
    "    endif

    " if &filetype == 'java'
    " call setline(8,   "public class ".expand('%:t:r')." {")
    " ""call setline(9,   "")
    " call setline(9,  "    public static void main(String[] args) {")
    " call setline(10,  "            " )
    " call setline(11,  "    }" )
    " ""call setline(13,  "" )
    " call setline(12,  "}" )
    " endif

endfunc

"新建文件后，自动定位到文件末尾
autocmd BufNewFile * normal G
