"""----- 基础配置 -----"""

let mapleader = ","
let g:mapleader = ","
" let g:python3_host_prog = '/usr/bin/python'

filetype on
filetype plugin on
filetype plugin indent on

" set number
" set relativenumber

set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set encoding=utf-8

syntax on               " 语法高亮
set showmatch           " 当光标置于成对符号（例如括号）时，高亮匹配的符号对

set hlsearch 
set ignorecase
set smartcase
exec 'nohlsearch'

" 共享外部剪贴板
set clipboard+=unnamed

" 去掉vi兼容性（set nocp）
set nocompatible

"""----- autocmd -----"""

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

autocmd BufRead,BufNewFile *.{md,MD,mdown,mkd,mkdn,markdown,mdwn} map <Leader>mt :!Typora % &<CR><CR>       

"""----- 按键映射 -----"""

" tab
noremap ta :tabe<CR>
noremap th :-tabnext<CR>
noremap tl :+tabnext<CR>

" 去除高亮
noremap <silent><leader>/ :nohls<CR>

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
call plug#begin()
    Plug 'SirVer/ultisnips'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'w0rp/ale'

    Plug 'fatih/vim-go', { 'for': 'go' , 'do': ':GoInstallBinaries' }
    Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
    Plug 'cespare/vim-toml', { 'for': 'toml' } 
    Plug 'elzr/vim-json', { 'for' : 'json' }
    Plug 'jceb/vim-orgmode'

    Plug 'scrooloose/nerdcommenter'
    Plug 'Yggdroot/indentLine', { 'for': 'python' }
    Plug 'dkarter/bullets.vim'

    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'EdenEast/nightfox.nvim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'luochen1990/rainbow'
    Plug 'gorodinskiy/vim-coloresque'

    Plug 'lewis6991/gitsigns.nvim'
    Plug 'mbbill/undotree'
    Plug 'ggandor/lightspeed.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'godlygeek/tabular'
    Plug 'rcarriga/nvim-notify'

    Plug 'h-hg/fcitx.nvim'
    Plug 'christoomey/vim-tmux-navigator'

    " telescope and its dependencies
    Plug 'nvim-lua/plenary.nvim'
    Plug 'BurntSushi/ripgrep'
    Plug 'sharkdp/fd'
    Plug 'nvim-telescope/telescope.nvim'
call plug#end()

""" nightfox 主题
colorscheme nordfox
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
set hidden
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
    \ 'coc-clangd'
    \]

""" rainbow
let g:rainbow_active = 1

""" undotree
nnoremap <leader>u :UndotreeToggle<CR>

""" lightspeed.nvim

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
let g:ale_sign_error = '✴'
let g:ale_sign_warning = '•'
let g:ale_echo_msg_error_str = '✹'
let g:ale_echo_msg_warning_str = '⚠'
let g:ale_echo_msg_format = '[%linter%] %severity% %s'
let g:ale_statusline_format = ['E•%d', 'W•%d', 'OK']

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

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

"""  tmux 相关
" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 1

""" 注释
" 注释时自动加一个空格
let g:NERDSpaceDelims=1
" python 设置成0时就会有空格，设成1反而多了一个空格
autocmd FileType python :let g:NERDSpaceDelims=0
" 取消注释后空行中的空格删除
" let g:NERDTrimTrailingWhitespace=1

