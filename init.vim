"""----- 基础配置 -----"""

let mapleader = " "
let g:mapleader = " "
" let g:python3_host_prog = '/usr/bin/python'

" 去掉vi兼容性（set nocp）
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" 文件类型
filetype on
filetype plugin on
filetype plugin indent on

" 开始界面
set shortmess=atI
set number
" set relativenumber
" 取消换行
" set nowrap
set showcmd

" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=7

" 缩进
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set encoding=utf-8
"set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set ffs=unix,mac,dos

" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m
" 合并两行中文时，不在中间加空格
set formatoptions+=B

syntax on               " 语法高亮
set showmatch           " 当光标置于成对符号（例如括号）时，高亮匹配的符号对

set hlsearch 
set ignorecase
set smartcase
exec 'nohlsearch'

" For regular expressions turn magic on
set magic

" " 代码折叠
" set foldenable
" " 折叠方法
" " manual    手工折叠
" " indent    使用缩进表示折叠
" " expr      使用表达式定义折叠
" " syntax    使用语法定义折叠
" " diff      对没有更改的文本进行折叠
" " marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
" set foldmethod=indent
" set foldlevel=99
" " 代码折叠自定义快捷键 <leader>zz
" let g:FoldMethod = 0
" map <leader>zz :call ToggleFold()<cr>
" fun! ToggleFold()
    " if g:FoldMethod == 0
        " exe "normal! zM"
        " let g:FoldMethod = 1
    " else
        " exe "normal! zR"
        " let g:FoldMethod = 0
    " endif
" endfun

set mouse-=a

" 共享外部剪贴板
"set clipboard+=unnamed
set clipboard^=unnamed,unnamedplus

" 切换缓冲区前自动保存文件
set hidden

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

" 自动改变当前目录
"set autochdir

set wildignore=*.swp,*.bak,*.pyc,*.class,.svn

" 设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制
" set t_ti= t_te=

" 自动补全相关
" 让Vim的补全菜单行为与一般IDE一致
set completeopt=longest,menu,preview
" 离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" " 回车即选中当前项
" inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

" " In the quickfix window, <CR> is used to jump to the error under the cursor, so undefine the mapping there.
" autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
" " quickfix window  s/v to open in split window,  ,gd/,jd => quickfix window => open it
" autocmd BufReadPost quickfix nnoremap <buffer> v <C-w><Enter><C-w>L
" autocmd BufReadPost quickfix nnoremap <buffer> s <C-w><Enter><C-w>K

" " command-line window
" autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>

" " 上下左右键的行为 会显示其他信息
" inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
" inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
" inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
" inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"""----- autocmd -----"""

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

autocmd BufRead,BufNewFile *.{md,MD,mdown,mkd,mkdn,markdown,mdwn} map <Leader>mt :!Typora % &<CR><CR>       

" vimrc文件修改之后自动加载
" autocmd bufwritepost $MYVIMRC source $MYVIMRC

"""----- 按键映射 -----"""

" 将;映射成: 不用按shift了(避免手残,变成切换中文,和输入中文的 ；)
map ; :

" tab
noremap ta :tabe<CR>
noremap th :-tabnext<CR>
noremap tl :+tabnext<CR>

" 去除高亮
noremap <silent><leader>/ :nohls<CR>
noremap <silent><leader><CR> :nohls<CR>

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

" 启动paste模式，粘贴时不用担心自动缩进影响                                                                 
" 其实可以直接用　"+p
:set pastetoggle=<leader>ps

" 插入当前时间
map <leader>xt a<c-r>=strftime("%Y/%m/%d %H:%M")<cr><ESC>

" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y

" 映射全选+复制 ctrl+A
map <C-A> ggVGY
map! <C-A> <Esc>ggVG

" 在编辑模式下将CTRL+Q映射到Esc，方便emacs里使用时避免vterm和evil的冲突
map! <C-Q> <Esc>

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

"""----- 插件 -----"""
" vim: curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" nvim: sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
call plug#begin()
    Plug 'SirVer/ultisnips'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'w0rp/ale'

    Plug 'fatih/vim-go', { 'for': 'go' , 'do': ':GoInstallBinaries' }
    Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
    Plug 'cespare/vim-toml', { 'for': 'toml' } 
    Plug 'elzr/vim-json', { 'for' : 'json' }
    Plug 'jceb/vim-orgmode'

    Plug 'Chiel92/vim-autoformat'
    Plug 'scrooloose/nerdcommenter'
    Plug 'Yggdroot/indentLine', { 'for': 'python' }
    Plug 'dkarter/bullets.vim'

    Plug 'EdenEast/nightfox.nvim', {'branch': 'main'}
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'luochen1990/rainbow'
    Plug 'gorodinskiy/vim-coloresque'

    Plug 'lewis6991/gitsigns.nvim', {'branch': 'main'}
    Plug 'mbbill/undotree'
    Plug 'ggandor/lightspeed.nvim', {'branch': 'main'}
    Plug 'godlygeek/tabular'
    Plug 'rcarriga/nvim-notify'

    Plug 'h-hg/fcitx.nvim'
    Plug 'christoomey/vim-tmux-navigator'

    " telescope and its dependencies
    Plug 'nvim-lua/plenary.nvim'
    Plug 'BurntSushi/ripgrep'
    Plug 'sharkdp/fd'
    Plug 'nvim-telescope/telescope.nvim'

    if has('nvim')
        Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    endif

call plug#end()

""" nightfox
colorscheme duskfox
"colorscheme nordfox
set cursorlineopt=screenline
set cursorline

""" airline
let g:airline_theme='deus'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

""" coc.nvim
set updatetime=100
set shortmess+=c
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

let g:coc_global_extensions = [
    \ 'coc-marketplace',
    \ 'coc-json',
    \ 'coc-pyright',
    \ 'coc-go',
    \ 'coc-clangd',
    \ 'coc-snippets', 
    \ 'coc-pairs'
    \]

""" rainbow
let g:rainbow_active = 1

""" undotree
nnoremap <leader>u :UndotreeToggle<CR>

""" gitsigns
noremap <leader>gd :Gitsigns preview_hunk<CR>
noremap <leader>gj :Gitsigns next_hunk<CR>
noremap <leader>gk :Gitsigns prev_hunk<CR>
noremap <leader>ga :Gitsigns stage_hunk<CR>
noremap <leader>gu :Gitsigns undo_stage_hunk<CR>

""" tabular 指定字符对齐文本
vnoremap <leader>t :Tabular /

""" telescope
nnoremap <leader>tf <cmd>Telescope find_files<cr>

""" bullets 自动列表
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit'
    \]

""" ale 
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

""" vim-go
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

""" markdown
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

""" NERDTree
map <leader>tr :NERDTreeToggle<CR>
map! <leader>tr <ESC>:NERDTreeToggle<CR>
"autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']

""" tmux 相关
" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 1

""" 注释
" 注释时自动加一个空格
let g:NERDSpaceDelims=1
" python 设置成0时就会有空格，设成1反而多了一个空格
" autocmd FileType python :let g:NERDSpaceDelims=0
" 取消注释后空行中的空格删除
let g:NERDTrimTrailingWhitespace=1

""" vim-autoformat
noremap <leader>af :Autoformat<CR>
" au BufWrite * :Autoformat
autocmd FileType c,cpp,java,go,php,haskell,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :Autoformat

let g:autoformat_verbosemode=1
" let g:autoformat_autoindent = 0
" let g:autoformat_retab = 0
" let g:autoformat_remove_trailing_spaces = 0
let g:formatters_python = ['black']
autocmd FileType vim,tex let b:autoformat_autoindent=0

if has('nvim') 

""" nvim-treesitter 高亮强化
lua <<EOF
require'nvim-treesitter.configs'.setup {
    -- one of "all", "language", or a list of languages
    ensure_installed = {'bibtex', 'html', 'json', 'python', 'vim', 'go', 'bash'},
    highlight = {
        enable = true,              -- false will disable the whole extension
    },
}
EOF

endif

