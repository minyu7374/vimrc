"""----- 按键映射 -----"""

""" 方便使用的短命令/小功能
noremap ： :

" 输入原生<Tab>
inoremap <S-Tab> <C-v><Tab>

"" evil 兼容
" 在编辑模式下将CTRL+Q映射到Esc，方便emacs在vterm里使用vim和evil的冲突
noremap! <C-Q> <Esc>
" emacs 中 CTRL+A/X 另有他用，保持和evil替代按键一致
noremap g= <C-A>
noremap g- <C-X>

" 重新加载配置
nnoremap R :source $MYVIMRC<CR>

" 插入空行
noremap <nowait> <leader>o o<Esc>k
noremap <nowait> <leader>O O<Esc>j

" 文件打开关闭保存等操作
noremap <silent><nowait> <leader><leader>w :w<CR>
noremap <silent><nowait> <leader>q :q<CR>
noremap <silent><nowait> <leader>W :w !sudo tee %<CR>
noremap <silent><nowait> <leader>Q :q!<CR>
noremap <silent><nowait> <leader>E :Explore<CR>

" 去除高亮
noremap <silent><leader>/ :nohls<CR>
noremap <silent><leader><CR> :nohls<CR>

" 调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv

" 插入当前时间
noremap <leader>xt a<c-r>=strftime("%Y/%m/%d %H:%M")<CR><ESC>

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

" 新建tab/切换tab  Alt+t Ctrl+t
nnoremap <M-t>     :tabnew<CR>
inoremap <M-t>     <Esc>:tabnew<CR>
nnoremap <C-t>   :tabnext<CR>
inoremap <C-t>   <Esc>:tabnext<CR>

""" 复制粘贴(不破坏原来的Ctrl+A/V)
vnoremap Y "+y
noremap P "+p
vnoremap P "+p
vnoremap <C-c> "+y
vnoremap <C-y> "+y
vnoremap <C-p> "+p

noremap <leader>y :set nopaste<CR>
noremap <leader>Y :set paste<CR>

" 映射全选+复制/粘贴
noremap <M-a> ggVG"+y
noremap! <M-a> <Esc>ggVG"+y
noremap <M-v> ggVG"+p
noremap! <M-v> <Esc>ggVG"+p

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
nnoremap <nowait> <leader>z :call Zoom()<CR>
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
