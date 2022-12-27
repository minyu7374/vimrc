"""----- 基础配置 -----"""

""" 全局配置
let g:mapleader = ' '

if has('linux')
    let g:python3_host_prog = '/usr/bin/python'
elseif has('mac') 
    let g:python3_host_prog = '/opt/local/bin/python'
endif

""" 编码相关
set encoding=utf-8
scriptencoding utf-8

"set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileformats=unix,mac,dos

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

""" 匹配语法高亮等
syntax on              
" 当光标置于成对符号（例如括号）时，高亮匹配的符号对
set showmatch           

set hlsearch 
set ignorecase
set smartcase
exec 'nohlsearch'

""" 特性
" 去掉vi兼容性（set nocp）
" set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" For regular expressions turn magic on
set magic

set mouse-=a

""" 读写
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
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif

    " " In the quickfix window, <CR> is used to jump to the error under the cursor, so undefine the mapping there.
    " autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
    " " quickfix window  s/v to open in split window,  ,gd/,jd => quickfix window => open it
    " autocmd BufReadPost quickfix nnoremap <buffer> v <C-w><Enter><C-w>L
    " autocmd BufReadPost quickfix nnoremap <buffer> s <C-w><Enter><C-w>K

    " " command-line window
    " autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>
augroup end

"""----- autocmd -----"""
augroup my_group
    au!

    """ 特定文件类型执行
    autocmd BufRead,BufNewFile *.{md,MD,mdown,mkd,mkdn,markdown,mdwn} map <Leader>mt :!Typora % &<CR><CR>       
    
    " 光标恢复上次位置
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

    " vimrc文件修改之后自动加载
    " autocmd bufwritepost $MYVIMRC source $MYVIMRC
augroup end

"""----- 按键映射 -----"""

" 将;映射成: 不用按shift了(避免手残,变成切换中文,和输入中文的 ；)
map ; :
" 在编辑模式下将CTRL+Q映射到Esc，方便emacs里使用时避免vterm和evil的冲突
map! <C-Q> <Esc>

" 重新加载配置
nnoremap R :source $MYVIMRC<CR>

" 方便使用的短命令
noremap <nowait> <leader>o o<Esc>k
noremap <nowait> <leader>O O<Esc>j
noremap <nowait> <leader>w :w<CR> 
noremap <nowait> <leader>q :q<CR> 

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

""" 复制粘贴
noremap Y "+y
noremap P "+p
vmap <C-c> "+y

" 映射全选+复制 ctrl+A
map <C-A> ggVGY
map! <C-A> <Esc>ggVG

""" 小功能
" 插入当前时间
map <leader>xt a<c-r>=strftime("%Y/%m/%d %H:%M")<cr><ESC>

""" panel 相关 
" 分屏
noremap <leader>sl :set splitright<CR>:vsplit<CR>
noremap <leader>sh :set nosplitright<CR>:vsplit<CR>
noremap <leader>sj :set splitbelow<CR>:split<CR>
noremap <leader>sk :set nosplitbelow<CR>:split<CR>

" panel切换调整
" tmux 已配置
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

    Plug 'fatih/vim-go', { 'for': 'go' , 'do': ':GoInstallBinaries' }
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
    Plug 'cespare/vim-toml', {'branch': 'main', 'for': 'toml', }
    Plug 'elzr/vim-json', { 'for' : 'json' }
    Plug 'jceb/vim-orgmode'

    Plug 'Chiel92/vim-autoformat'
    Plug 'scrooloose/nerdcommenter'
    Plug 'Yggdroot/indentLine', { 'for': 'python' }
    Plug 'dkarter/bullets.vim'

    Plug 'EdenEast/nightfox.nvim', { 'branch': 'main' }
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
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
        Plug 'rcarriga/nvim-notify'
        Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

        " telescope and its dependencies
        Plug 'nvim-lua/plenary.nvim'
        Plug 'BurntSushi/ripgrep'
        Plug 'sharkdp/fd'
        Plug 'nvim-telescope/telescope.nvim'
    else
        Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
    endif

call plug#end()

""" colorscheme
:execute 'colorscheme' has('linux') ? 'nordfox' : 'duskfox'
set cursorlineopt=screenline
set cursorline

""" airline
let g:airline_theme='deus'
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
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
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
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
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
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
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

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <leader><leader>c  :<C-u>CocList<cr>
nnoremap <silent><nowait> <leader><leader>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <leader><leader>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <leader><leader>m  :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <leader>:  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <leader><leader>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <leader><leader>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <leader>cj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <leader>ck  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <leader>cp  :<C-u>CocListResume<CR>

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

"let g:ale_enabled = 0
" 始终开启标志列设置
" let g:ale_sign_column_always = 1

" 指定启用的linters
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
" 理由同 syntastic_python_flake8_args的设置(https://pep8.readthedocs.io/en/release-1.7.x/intro.html#error-codes)
" let g:ale_python_flake8_options = '-m flake8 --ignore=E501,E225,E124,E712,E116,E131,E401,E402'
let g:ale_python_flake8_options = '-m flake8 --ignore=E501,E401,E402,E722'


augroup ale_python_group
    au!
    autocmd FileType python nnoremap <leader>p2 :let g:ale_python_flake8_executable = 'python2'<CR>
    autocmd FileType python nnoremap <leader>p3 :let g:ale_python_flake8_executable = 'python3'<CR>
augroup end

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

nnoremap ej <Plug>(ale_next)
nnoremap ek <Plug>(ale_previous)

nmap <leader>te :ALEToggle<CR>

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

""" 注释
" 注释时自动加一个空格
let g:NERDSpaceDelims=1
" python 设置成0时就会有空格，设成1反而多了一个空格
" autocmd FileType python :let g:NERDSpaceDelims=0
" 取消注释后空行中的空格删除
let g:NERDTrimTrailingWhitespace=1

""" vim-autoformat
noremap <leader>fc :Autoformat<CR>
let g:autoformat_verbosemode=1
" let g:autoformat_autoindent = 0
" let g:autoformat_retab = 0
" let g:autoformat_remove_trailing_spaces = 0
let g:formatters_python = ['black']

augroup autoformat_group
    au!
    " au BufWrite * :Autoformat
    autocmd FileType c,cpp,java,go,php,haskell,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :Autoformat
    autocmd FileType vim,tex let b:autoformat_autoindent=0
augroup end

""" NERDTree
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

""" vista(tagbar)
map <leader>ti :Vista!!<CR>

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

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

map <leader><leader>j <Plug>(easymotion-j)
map <leader><leader>k <Plug>(easymotion-k)
map <leader><leader>h <Plug>(easymotion-linebackward)
map <leader><leader>l <Plug>(easymotion-lineforward)
map <leader><leader>f <Plug>(easymotion-bd-f)
map <leader><leader>. <Plug>(easymotion-repeat)

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
let g:tmux_navigator_save_on_switch = 1

if has('nvim') 

    """ telescope
    " Find files using Telescope command-line sugar.
    nnoremap <leader>fo <cmd>Telescope<cr>
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>

    """ nvim-treesitter 高亮强化
    lua <<EOF
require'nvim-treesitter.configs'.setup {
    -- one of "all", "language", or a list of languages
    ensure_installed = {'bash', 'awk', 'c', 'cpp', 'go', 'haskell', 'lua', 'python', 'sql', 'html', 'json', 'latex', 'markdown', 'rust', 'toml', 'yaml', 'vim'},
    highlight = {
        enable = true,              -- false will disable the whole extension
    },
}
EOF

else

    """ clap
    nnoremap <leader>fo <cmd>Clap<cr>
    nnoremap <leader>ff <cmd>Clap files<cr>
    nnoremap <leader>fg <cmd>Clap live_grep<cr>
    nnoremap <leader>fb <cmd>Clap buffers<cr>
    nnoremap <leader>fh <cmd>Clap help_tags<cr>

endif
