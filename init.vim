"""----- 基础配置 -----"""

""" 全局配置
let g:mapleader = ' '

if has('linux')
    let g:python3_host_prog = '/usr/bin/python'
elseif has('mac') 
    let g:python3_host_prog = '/opt/local/bin/python'
elseif has('win64') || has('win32')
    let g:python3_host_prog = 'C:\Python311\python.exe'
endif

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

" 默认为粘贴模式
set paste

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
let g:haddock_browser="/usr/bin/elinks"
let g:haddock_browser_callformat="%s file://%s >/dev/null 2>&1 &"

"""----- autocmd -----"""
augroup my_group
    au!

    """ 特定文件类型执行
    " autocmd BufRead,BufNewFile *.{md,MD,mdown,mkd,mkdn,markdown,mdwn} map <Leader>mt :!Typora % &<CR><CR>
    let b:sys_open=has('linux') ? 'xdg-open' : 'open'
    autocmd BufRead,BufNewFile * map <leader>mo :execute '!' . b:sys_open '% &'<CR><CR>
    autocmd BufRead,BufNewFile *.py map <leader>pz :set foldmethod=indent<CR>
    
    " 光标恢复上次位置
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

    " haskellmod
    au BufEnter *.hs compiler ghc

    " vimrc文件修改之后自动加载
    " autocmd bufwritepost $MYVIMRC source $MYVIMRC
augroup end

"""----- 按键映射 -----"""

""" 方便使用的短命令/小功能
" 将;映射成: 不用按shift了(避免手残,变成切换中文,和输入中文的 ；)
map ; :
" 在编辑模式下将CTRL+Q映射到Esc，方便emacs里使用时避免vterm和evil的冲突
map! <C-Q> <Esc>

" 重新加载配置
nnoremap R :source $MYVIMRC<CR>

" 插入空行
noremap <nowait> <leader>o o<Esc>k
noremap <nowait> <leader>O O<Esc>j

" 文件打开关闭保存等操作
noremap <silent><nowait> <leader>w :w<CR>
noremap <silent><nowait> <leader>q :q<CR>
noremap <silent><nowait> <leader>W :w !sudo tee %<CR>
noremap <silent><nowait> <leader>e :Explore<CR>

" 去除高亮
noremap <silent><leader>/ :nohls<CR>
noremap <silent><leader><CR> :nohls<CR>

" 调整缩进后自动选中，方便再次操作 
vnoremap < <gv 
vnoremap > >gv 

" 插入当前时间
map <leader>xt a<c-r>=strftime("%Y/%m/%d %H:%M")<CR><ESC>

" 不让*跳转: https://stackoverflow.com/questions/4256697/vim-search-and-highlight-but-do-not-jump
" nnoremap * :keepjumps normal! mi*`i<CR>
nnoremap <silent> * :let @/= '\<' . expand('<cword>') . '\>' <Bar> set hls <CR>
nnoremap <silent> g* :let @/=expand('<cword>') <Bar> set hls <CR>

""" tab
nnoremap tn  :tabnew<CR>
nnoremap te  :tabedit<Space>
nnoremap td  :tabclose<CR>
nnoremap tm  :tabmove<Space>

nnoremap th  :tabfirst<CR>
nnoremap tl  :tablast<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>

nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>0 :tablast<CR>

" 新建tab/切换tab  Ctrl+t Ctrl+Tab
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>
nnoremap <C-Tab>   :tabnext<CR>
inoremap <C-Tab>   <Esc>:tabnext<CR>

""" 复制粘贴(不破坏原来的Ctrl+A/V)
vmap Y "+y
noremap P "+p
vmap P "+p
vmap <C-c> "+y
vmap <C-y> "+y
vmap <C-p> "+p

map <leader>po :set paste<CR>
map <leader>pf :set nopaste<CR>

" 映射全选+复制/粘贴
map <M-a> ggVG"+y
map! <M-a> <Esc>ggVG"+y
map <M-v> ggVG"+p
map! <M-v> <Esc>ggVG"+p

""" panel 相关 
" 分屏
noremap <leader>sl :set splitright<CR>:vsplit<CR>
noremap <leader>sh :set nosplitright<CR>:vsplit<CR>
noremap <leader>sj :set splitbelow<CR>:split<CR>
noremap <leader>sk :set nosplitbelow<CR>:split<CR>

" panel切换调整
" tmux 有对应配置
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
nnoremap <C-\> <C-W>w

nnoremap <leader>wj <C-W>j
nnoremap <leader>wk <C-W>k
nnoremap <leader>wh <C-W>h
nnoremap <leader>wl <C-W>l
nnoremap <leader>ww <C-W>w
nnoremap <leader>w\ <C-W>w
nnoremap <leader>wv <C-W>v
nnoremap <leader>ws <C-W>s

" +- 本有上下行的功能，但平时都用JK, 这里不要了，用来调整窗口
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

" 临时最大化 panel. :only(<C-W>O)不等还原原来的分屏
nmap <nowait> <leader>z :call Zoom()<CR>
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
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'honza/vim-snippets'
    Plug 'w0rp/ale'

    " Plug 'fatih/vim-go', { 'for': 'go' , 'do': ':GoInstallBinaries' }
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
    Plug 'cespare/vim-toml', {'branch': 'main', 'for': 'toml', }
    Plug 'elzr/vim-json', { 'for' : 'json' }
    Plug 'tpope/vim-speeddating'
    Plug 'jceb/vim-orgmode'
    Plug 'tpope/vim-fugitive'

    Plug 'scrooloose/nerdcommenter'
    Plug 'dkarter/bullets.vim'

    " Plug 'EdenEast/nightfox.nvim', { 'branch': 'main' }
    Plug 'joshdick/onedark.vim'
    "改进各种语言的语法突出显示
    Plug 'sheerun/vim-polyglot' 
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'luochen1990/rainbow'
    Plug 'gorodinskiy/vim-coloresque'

    "替代 preservim/tagbar
    Plug 'liuchengxu/vista.vim' 
    Plug 'mbbill/undotree'
    Plug 'easymotion/vim-easymotion'

    Plug 'h-hg/fcitx.nvim'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'voldikss/vim-floaterm'

    if has('nvim')
        Plug 'nvim-tree/nvim-web-devicons'     " optional(file icons)
        Plug 'nvim-tree/nvim-tree.lua'

        Plug 'lukas-reineke/indent-blankline.nvim'

        Plug 'rcarriga/nvim-notify'
        Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

        " telescope and its dependencies
        Plug 'nvim-lua/plenary.nvim'
        Plug 'BurntSushi/ripgrep'
        Plug 'sharkdp/fd'
        Plug 'nvim-telescope/telescope.nvim'
        Plug 'fannheyward/telescope-coc.nvim'
    else
        Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

        "Plug 'Yggdroot/indentLine', { 'for': ['python', 'json'] }
        Plug 'Yggdroot/indentLine'

        Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
        Plug 'vn-ki/coc-clap'
    endif

call plug#end()

""" colorscheme
" :execute 'colorscheme' has('mac') ? 'duskfox' : 'nordfox'
if !empty($STY) && !has("gui_running")
  " 针对 GNU screen，设置透明背景，避免色彩展示问题（screen会设置STY环境变量）
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif
colorscheme onedark
" 光标所在行的背景颜色与屏幕上其他可见行的背景颜色相同
set cursorlineopt=screenline
" 在光标所在行上绘制一条水平线，使其更易于区分
set cursorline

""" airline
" deus/dark/onedark/solarized/tomorrow
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
" let g:airline_symbols.paste = 'Þ'
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
" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <CR> could be remapped by other vim plugin
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" trigger completion.
inoremap <silent><expr> <c-@> coc#refresh()

" navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> gk <Plug>(coc-diagnostic-prev)
nmap <silent> gj <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" show documentation in preview window.
nnoremap <silent> gK :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . ' ' . expand('<cword>')
  endif
endfunction

" Symbol renaming.
nmap <leader>cr <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format-selected)

augroup coc_group
  autocmd!
  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')
  " Setup formatexpr specified filetype(s).
  autocmd FileType c,cpp,go,rust,bash,awk,python,typescript,sql,json,toml,yaml,vim setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
xmap <leader>as <Plug>(coc-codeaction-selected)
nmap <leader>as <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>aa  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>af  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<CR>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<CR>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
" nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

nmap <leader>fc :Format<CR>
nmap <leader>fz :Fold<CR>
nmap <leader>fi :OR<CR>

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
nnoremap <silent><nowait> <leader><leader>c  :<C-u>CocList<CR>
" Manage extensions.
nnoremap <silent><nowait> <leader><leader>x  :<C-u>CocList extensions<CR>
" Extensions marketplace.
nnoremap <silent><nowait> <leader><leader>p  :<C-u>CocList marketplace<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <leader><leader>r  :<C-u>CocListResume<CR>
" Do default action for next item.
nnoremap <silent><nowait> <leader>cj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <leader>ck  :<C-u>CocPrev<CR>

let g:coc_global_extensions = [
    \ 'coc-marketplace',
    \ 'coc-floaterm',
    \ 'coc-git',
    \ 'coc-pyright',
    \ 'coc-go',
    \ 'coc-clangd',
    \ 'coc-snippets', 
    \ 'coc-pairs',
    \ 'coc-markdownlint',
    \ 'coc-sh',
    \ 'coc-sql',
    \ 'coc-vimlsp',
    \]

""" coc-snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" convert visual selected code to snippet
xmap <leader>cx  <Plug>(coc-convert-snippet)

""" coc-git
" navigate chunks of current buffer
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" navigate conflicts of current buffer
nmap [c <Plug>(coc-git-prevconflict)
nmap ]c <Plug>(coc-git-nextconflict)
" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
" show commit contains current position
nmap gc <Plug>(coc-git-commit)
" create text object for git chunks
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)

""" ale 
" The easiest way to get both plugins to work together is to configure coc.nvim to send diagnostics to ALE, so ALE controls how all problems are presented to you, and to disable all LSP features in ALE, so ALE doesn't try to provide LSP features already provided by coc.nvim, such as auto-completion.
" Open your coc.nvim configuration file with :CocConfig and add "diagnostic.displayByAle": true to your settings.
" Add let g:ale_disable_lsp = 1 to your vimrc file, before plugins are loade
" 方案选择: 正常使用coc的功能(不向ale传递诊断信息)；默认不开启ale，同时关闭ale的lsp特性，不必提供coc提供过的功能
let g:ale_enabled = 0
let g:ale_disable_lsp = 1

" 常用命令映射
nmap <leader>te :ALEToggle<CR>
nnoremap ej <Plug>(ale_next)
nnoremap ek <Plug>(ale_previous)

" 指定启用的linters
let g:ale_linters = {
            \  'c': ['clang'],
            \  'cpp': ['clang'],
            \  'go': ['golint', 'gopls'],
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
" 理由同 syntastic_python_flake8_args的设置(https://pep8.readthedocs.io/en/release-1.7.x/intro.html#error-codes)
" let g:ale_python_flake8_options = '-m flake8 --ignore=E501,E225,E124,E712,E116,E131,E401,E402'
let g:ale_python_flake8_options = '-m flake8 --ignore=E501,E401,E402,E722'

augroup ale_python_group
    au!
    autocmd FileType python nnoremap <leader>p2 :let g:ale_python_flake8_executable = 'python2'<CR>
    autocmd FileType python nnoremap <leader>p3 :let g:ale_python_flake8_executable = 'python3'<CR>
augroup end

" ale行为控制
" " run linters only when I save files
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_insert_leave = 0
" " don't want linters to run on opening a file
" let g:ale_lint_on_enter = 0

" " use the quickfix list or the loclist
" let g:ale_set_quickfix = 1
" let g:ale_set_loclist = 0

" show Vim windows for the loclist or quickfix items when a file contains warnings or errors
" let g:ale_open_list = 1
" keep the window open even after errors disappear
"let g:ale_keep_list_window_open = 1

" 始终开启标志列设置
" let g:ale_sign_column_always = 1

" 取消错误处高亮
" let g:ale_set_highlights = 0

" " If emoji not loaded, use default sign
" try
    " "let g:ale_sign_error = emoji#for('boom')
    " let g:ale_sign_error = emoji#for('eight_pointed_black_star')
    " let g:ale_sign_warning = emoji#for('small_orange_diamond')
" catch
    " let g:ale_sign_error = '✴'
    " let g:ale_sign_warning = '⚠'
" endtry
let g:ale_sign_error = '✴'
let g:ale_sign_warning = '⚠'
let g:ale_echo_msg_format = '[%linter%] %severity% %s'
let g:ale_statusline_format = ['E•%d', 'W•%d', 'OK']

" 标记的背景色调整，ALE之前warning默认用的todo太抢眼了
" highlight clear ALEErrorSign
" highlight clear ALEWarningSign
highlight link ALEErrorSign ErrorMsg
highlight link ALEWarningSign WarningMsg

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

let g:ale_echo_msg_error_str = '✴'
let g:ale_echo_msg_warning_str = '⚠'

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

" """ vim-go
" let g:go_def_mode='gopls'
" let g:go_info_mode='gopls'

""" markdown
" let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_folding_level = 6
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

""" 注释
" 注释时自动加一个空格
let g:NERDSpaceDelims=1
" python 设置成0时就会有空格，设成1反而多了一个空格
" autocmd FileType python :let g:NERDSpaceDelims=0
" 取消注释后空行中的空格删除
let g:NERDTrimTrailingWhitespace=1

""" vista(tagbar)
map <leader>tv :Vista!!<CR>

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

augroup vista_group
    au!
    " By default vista.vim never run if you don't call it explicitly.
    " show the nearest function in your statusline automatically
    autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
augroup end

" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works for the kind renderer, not the tree renderer.
let g:vista_icon_indent = ['╰─▸ ', '├─▸ ']

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'coc'

" Set the executive for some filetypes explicitly. Use the explicit executive
" instead of the default one for these filetypes when using `:Vista` without
" specifying the executive.
let g:vista_executive_for = {
      \ }

" Declare the command including the executable and options used to generate ctags output
" for some certain filetypes.The file path will be appened to your custom command.
let g:vista_ctags_cmd = {
      \ 'haskell': 'hasktags -x -o - -c',
      \ }

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
let g:vista_fzf_preview = ['right:50%']

""" easymotion
let g:EasyMotion_smartcase = 1

nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
map <leader>h <Plug>(easymotion-linebackward)
map <leader>l <Plug>(easymotion-lineforward)
map <leader>. <Plug>(easymotion-repeat)

""" git
map <leader>gs :Git status<CR>
map <leader>gc :Git commit<CR>
map <leader>gC :Git commit -v<CR>
map <leader>gp :Git push<CR>

map <leader>ga :Git add %<CR>
map <leader>gr :Gread<CR>
map <leader>gw :Gwrite<CR>
map <leader>gm :GMove<CR>
map <leader>gd :GDelete<CR>

map <leader>gg :Ggrep<space>
map <leader>gv :Gvdiffsplit<CR>
map <leader>gV :Gvdiffsplit<space>

""" rainbow
let g:rainbow_active = 1

""" undotree
nnoremap <nowait> <leader>u :UndotreeToggle<CR>

""" tabular 指定字符对齐文本
vnoremap <leader>tl :Tabular /

""" bullets 自动列表
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit'
    \]

""" floatterm
let g:floaterm_keymap_new = '<leader>ft'
let g:floaterm_keymap_prev = '<leader>fk'
let g:floaterm_keymap_next = '<leader>fj'
let g:floaterm_keymap_toggle = '<leader>tf'

""" tmux 相关
" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigjtor_save_on_switch = 1

"""*** vim/nvim使用不同的插件, 如搜索框架等
if has('nvim')
    """ indent-blankline
    lua <<EOF
require "ibl".setup { enabled = false }
EOF
    autocmd FileType python,json IBLEnable
    nmap <leader>ti :IBLToggle<CR>

    """ nvim-tree
    let g:loaded_netrw = 1
    let g:loaded_netrwPlugin = 1

    " lua require('nvim-tree').setup()
    lua <<EOF
local function self_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
end

require("nvim-tree").setup {
  on_attach = self_on_attach,
  sort = { sorter = "case_sensitive", },
  renderer = { group_empty = true, },
  --filters = { dotfiles = true, },
}
EOF

    map <leader>tr :NvimTreeToggle<CR>

    " 参考nerdtree
    augroup nvimtree_group
        au!
        autocmd StdinReadPre * let s:std_in=1
        autocmd VimEnter * if (argc() == 0 && !exists('s:std_in') && v:this_session == '') | execute 'NvimTreeFocus' | endif
    augroup end

    """ nvim-treesitter 高亮强化
    set foldmethod=expr
    set foldexpr=nvim_treesitter#foldexpr()
    set nofoldenable            " Disable folding at startup.

    lua <<EOF
require'nvim-treesitter.configs'.setup {
    -- one of "all", "language", or a list of languages
    ensure_installed = {'bash', 'awk', 'c', 'cpp', 'go', 'rust', 'haskell', 'lua', 'python', 'sql', 'html', 'latex', 'vim'},
    auto_install = true,
    highlight = {
        enable = true,              -- false will disable the whole extension
    },

    -- 增量选择有bug，暂时不用
    -- incremental_selection = {
    --     enable = true,
    --     keymaps = {
    --       init_snlection = "<CR>",   -- set to `false` to disable one of the mappings
    --       node_incremental = "<CR>",
    --       scope_incremental = "<BS>",
    --       node_decremental = "<TAB>",
    --     },
    -- },

    -- Indentation based on treesitter for the = operator. NOTE: This is an experimental feature.
    indent = {
        enable = true,
    },
}
EOF

    """ telescope
    " Find files using Telescope command-line sugar.
    nnoremap <silent><nowait> <leader><leader>f  :<C-u>Telescope<CR>
    nnoremap <leader>fo <cmd>Telescope<CR>
    nnoremap <leader>ff <cmd>Telescope find_files<CR>
    " 添加Esc键，方便直接进行选择
    nnoremap <leader>fg <cmd>Telescope grep_string<CR><Esc>
    nnoremap <leader>fv <cmd>Telescope live_grep<CR>
    nnoremap <leader>fb <cmd>Telescope buffers<CR>
    nnoremap <leader>fh <cmd>Telescope help_tags<CR>

    """ Telescope-coc
    lua require('telescope').load_extension('coc')
    nnoremap <silent><nowait> <leader><leader>C  :<C-u>Telescope coc<CR>
    " Show all diagnostics.
    nnoremap <silent><nowait> <leader><leader>e  :<C-u>Telescope coc diagnostics<CR>
    " Show commands.
    nnoremap <silent><nowait> <leader><leader>m  :<C-u>Telescope coc commands<CR>
    nnoremap <silent><nowait> <leader>:  :<C-u>Telescope coc commands<CR>
    " Find symbol of current document.
    nnoremap <silent><nowait> <leader><leader>o  :<C-u>Telescope coc document_symbols<CR>
    " Search workspace symbols.
    nnoremap <silent><nowait> <leader><leader>s  :<C-u>Telescope coc workspace_symbols<CR>

else
    """ indentline
    let g:indentLine_enabled = 0

    autocmd FileType python,json IndentLinesEnable
    nmap <leader>ti :IndentLinesToggle<CR>

    """ nerdtree
    map <leader>tr :NERDTreeToggle<CR>
    augroup nerdtree_group
        au!
        " Start NERDTree, unless a file or session is specified, eg. vim -S session_file.vim.
        autocmd StdinReadPre * let s:std_in=1
        autocmd VimEnter * if (argc() == 0 && !exists('s:std_in') && v:this_session == '') | execute 'NERDTree' | endif
        " Close the tab if NERDTree is the only window remaining in it.
        autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
    augroup end
    let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']

    """ clap
    nnoremap <silent><nowait> <leader><leader>f  :<C-u>Clap<CR>
    nnoremap <leader>fo <cmd>Clap<CR>
    nnoremap <leader>ff <cmd>Clap files<CR>
    nnoremap <leader>fg <cmd>Clap grep ++query=<cword><CR>
    nnoremap <leader>fv <cmd>Clap live_grep<CR>
    nnoremap <leader>fb <cmd>Clap buffers<CR>
    nnoremap <leader>fh <cmd>Clap help_tags<CR>

    """ coc-clap
    " Show all diagnostics.
    nnoremap <silent><nowait> <leader><leader>e  :<C-u>Clap coc_diagnostics<CR>
    " Manage extensions.
    nnoremap <silent><nowait> <leader><leader>X  :<C-u>CocList extensions<CR>
    " Show commands.
    nnoremap <silent><nowait> <leader><leader>m  :<C-u>Clap coc_commands<CR>
    nnoremap <silent><nowait> <leader>:  :<C-u>Clap coc_commands<CR>
    " Find symbol of current document.
    nnoremap <silent><nowait> <leader><leader>o  :<C-u>Clap coc_outline<CR>
    " Search workspace symbols.
    nnoremap <silent><nowait> <leader><leader>s  :<C-u>Clap coc_symbols<CR>

endif
