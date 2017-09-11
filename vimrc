" 先设置好 <Leader>
let mapleader = ","
let g:mapleader = ","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'easymotion/vim-easymotion'

Plugin 'fatih/vim-go'
Plugin 'davidhalter/jedi-vim'
Plugin 'tpope/vim-fugitive'

Bundle 'Valloric/YouCompleteMe'
Bundle 'Valloric/ListToggle'

"Bundle 'scrooloose/syntastic'
" 异步并发检查
Plugin 'w0rp/ale'

Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdcommenter'

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

Bundle 'tomasr/molokai'
Bundle 'altercation/vim-colors-solarized'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()

filetype plugin indent on
" 忽视插件改变缩进
filetype plugin on

" 自动补全相关
" 让Vim的补全菜单行为与一般IDE一致
set completeopt=longest,menu
" 离开插入模式后自动关闭预览窗口 
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" 回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0

let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <F4> :YcmDiags<CR>

" jedi python 版本
let g:jedi#force_py_version = 2
autocmd FileType python nnoremap <leader>j2 :let g:jedi#force_py_version = 2<CR>
autocmd FileType python nnoremap <leader>j3 :let g:jedi#force_py_version = 3<CR>

" pip install flake8 没用flake8之前，检查不了未定义变量; 而且python版本jedi强制设置成2,还是会提示print错误
let g:syntastic_python_checkers=['flake8', ]
" pep8 的检查过于烦人, 而且和yapf有冲突(比如行长79和80)，忽略掉. 单独写了yapf格式化的键盘映射
"let g:syntastic_python_flake8_args='--ignore=E501,E225'
let g:syntastic_python_flake8_args='--ignore=E501,E225,E124,E712,E116,E131'

""" w0rp/ale 相关 """
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1
" no linters to run on opening a file
let g:ale_lint_on_enter = 0
" use the quickfix list instead of the loclist
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
" show Vim windows for the loclist or quickfix items when a file contains warnings or errors
let g:ale_open_list = 1
" keep the window open even after errors disappear
"let g:ale_keep_list_window_open = 1
"let g:ale_enabled = 0
" 始终开启标志列设置
"let g:ale_sign_column_always = 1
" 指定启用的linters
" c         cppcheck, cpplint, gcc, clang, clangtidy!!, clang-format
" cpp	    clang, clangcheck!!, clangtidy!!, cppcheck, cpplint!!, gcc, clang-format
" haskell	ghc, stack-ghc, stack-build !!, ghc-mod, stack-ghc-mod, hlint, hdevtools
" go	    gofmt, go vet, golint, gometalinter !!, go build!!, gosimple, staticcheck
" html	    HTMLHint, proselint, tidy
" Python	autopep8, flake8, isort, mypy, pycodestyle, pylint!!, yapf 
let g:ale_linters = {
\  'c': ['clang'],
\  'cpp': ['clang'],
\  'go': 'all',
\  'sh': ['shellcheck'],
\  'bash': ['shellcheck'],
\  'awk': ['gawk'],
\  'lua': ['luacheck'],
\  'sql': ['sqlint'],
\  'python': ['flake8'],
\  'markdown': ['mdl'],
\  'html': [],
\  'txt': [],
\}
" 针对python的设置
let g:ale_python_flake8_executable = 'python2'
autocmd FileType python nnoremap <leader>p2 :let g:ale_python_flake8_executable = 'python2'<CR>
autocmd FileType python nnoremap <leader>p3 :let g:ale_python_flake8_executable = 'python3'<CR>
" 理由同 syntastic_python_flake8_args 的设置
let g:ale_python_flake8_options = '-m flake8 --ignore=E501,E225,E124,E712,E116,E131'

let g:ale_set_highlights = 0
" If emoji not loaded, use default sign
try
  let g:ale_sign_error = emoji#for('boom')
  let g:ale_sign_warning = emoji#for('small_orange_diamond')
catch
  " Use same sign and distinguish error and warning via different colors.
  let g:ale_sign_error = '>>'
  let g:ale_sign_warning = '--'
endtry
let g:ale_echo_msg_format = '[#%linter%#] %s [%severity%]'
let g:ale_statusline_format = ['E•%d', 'W•%d', 'OK']

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

nmap <Leader>en <Plug>(ale_next)
nmap <Leader>ep <Plug>(ale_previous)
nnoremap <Leader>ts :ALEToggle<CR>
nnoremap <Leader>ah :set g:ale_sign_column_always = 0<CR>
nnoremap <Leader>as :set g:ale_sign_column_always = 1<CR>

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

" NERDTree相关
map <F2> :NERDTreeToggle<CR>
map! <F2> <ESC>:NERDTreeToggle<CR>
"autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif

" Tagbar配置
"nmap <F8> :TagbarToggle<CR>
map <F8> :TagbarToggle<CR>
map! <F8> <ESC>:TagbarToggle<CR>i
let g:tagbar_autofocus = 1

" 配色方案
set background=dark
set t_Co=256
colorscheme solarized
"colorscheme molokai
"colorscheme corporation

" 以下是vim自带配色方案(/usr/share/vim/vim80/colors)
" blue darkblue default delek desert elflord evening industry koehler morning
" murphy pablo peachpuff README.txt ron shine slate torte zellner
"colorscheme desert

" solarized
syntax enable
let g:solarized_termcolors=256
let g:solarized_termtrans = 1
let g:solarized_degrade = 1
let g:solarized_contrast = "normal"
let g:solarized_visibility = "normal"

" molokai
let g:molokai_original = 1

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
autocmd VimEnter * silent !tmux set -g status off
autocmd VimLeave * silent !tmux set -g status on
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 常规配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

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
"set nocompatible

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
autocmd FileType ruby,javascript,html,css,xml set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai

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
set cursorline "set cul
"set cursorcolumn "set cuc
highlight CursorLine   cterm=NONE ctermbg=NONE ctermfg=DarkCyan guibg=NONE guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=NONE ctermfg=DarkCyan guibg=NONE guifg=NONE

" python为方便标记第80列(pep8规范)
autocmd FileType python :set colorcolumn=80
autocmd FileType python :highlight ColorColumn ctermbg=Black

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
set autochdir

" 搜索逐字符高亮
set hlsearch
set incsearch

" 搜索忽略大小写
set ignorecase
set smartcase

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


""""""""""""""""""""""""""""""""""""""""
" 自定义按键
"""""""""""""""""""""""""""""""""""""""""
" 将;映射成: 不用按shift了(避免手残,变成切换中文,和输入中文的 ；)
map ; :

" 关闭方向键
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" 调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv

" panel 相关
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-H> <C-W><C-H>
"nnoremap <C-L> <C-W><C-L>
nnoremap wj <C-W><C-J>
nnoremap wk <C-W><C-K>
nnoremap wh <C-W><C-H>
nnoremap wl <C-W><C-L>
nnoremap vs <C-w>v
nnoremap hs <C-w>s

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

" 高亮当前行列的开关
map <F9> :set cuc!<CR>
map! <F9> <ESC>:set cuc!<CR>i
map <F10> :set cul!<CR>
map! <F10> <ESC>:set cul!<CR>i

" tabNext
map <S-Tab> :tabNext<CR>
map <S-T> :tabnew<CR>

" 启动paste模式，粘贴时不用担心自动缩进影响
" 其实可以直接用　"+p　
:set pastetoggle=<F3>

" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y
"vmap <M-c> "+y
"vmap <A-c> "+y
"vmap <D-c> "+y

" 映射全选+复制 ctrl+A
"map <C-A> ggVGY
"map! <C-A> <Esc>ggVG

" 跳转到文件头和尾
"map <F11> gg
"map! <F11> <ESC>ggi
"map <F12> G
"map! <F12> <ESC>Gi

"" 编译运行调试相关 """
" C，C++ 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
map! <F5> <ESC>:call CompileRunGcc()<CR>

func! CompileRunGcc()
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
        :!python %
    endif
    exec "q"
endfunc

" C,C++的调试
map <F7> :call Rungdb()<CR>
map! <F7> <ESC>:call Rungdb()<CR>

func! Rungdb()
        exec "w"
        exec "!g++ % -g -o %<"
        exec "!gdb ./%<"
endfunc

" 针对C++11
map <F6> :call CompileRunGcc11()<CR>
map! <F6> <ESC>:call CompileRunGcc11()<CR>

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自动执行类
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd FileType python nnoremap <Leader>yf :!yapf --style google -i % <CR><CR>
autocmd FileType python nnoremap <Leader>yf :0,$!yapf --style google<CR> "这样不太安全,但比较方便,如果报错,按U回退即可.
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

" 保存代码时删除多余空格
autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.py,*.go,*.lua exec ":call SetTitle()" 
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

	if &filetype == 'java'
	call setline(8,   "public class ".expand('%:t:r')." {")
		""call setline(9,   "")
		call setline(9,  "    public static void main(String[] args) {")
		call setline(10,  "            " )
		call setline(11,  "    }" )
		""call setline(13,  "" )
		call setline(12,  "}" )
	endif
	
endfunc

"新建文件后，自动定位到文件末尾
autocmd BufNewFile * normal G
