"""----- autocmd -----"""
augroup my_group
    au!

    """ 特定文件类型执行
    " autocmd BufRead,BufNewFile *.{md,MD,mdown,mkd,mkdn,markdown,mdwn} map <Leader>mt :!Typora % &<CR><CR>
    let b:sys_open=has('linux') ? 'xdg-open' : 'open'
    autocmd BufRead,BufNewFile * noremap <leader>mo :execute '!' b:sys_open '% &'<CR><CR>

    " 光标恢复上次位置
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

    " haskellmod
    au BufEnter *.hs compiler ghc

    " vimrc文件修改之后自动加载
    " autocmd bufwritepost $MYVIMRC source $MYVIMRC

    " 大文件禁用foldmethod
    autocmd BufReadPre * let f=expand("<afile>") | if getfsize(f) > 1024*1024 | setlocal foldmethod=manual | endif

    " 保存前自动去除行尾空白
    autocmd BufWritePre * call s:TrimTrailingWhitespace()

    " 高亮 TODO/FIXME 等标记（matchadd 为窗口局部，需每个窗口挂一次）
    autocmd VimEnter,WinEnter,BufWinEnter * call s:HighlightTodo()

augroup end

" 保存前去除行尾空白（markdown 行尾双空格有意义，跳过）
function! s:TrimTrailingWhitespace() abort
    if &filetype ==# 'markdown'
        return
    endif
    let l:view = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:view)
endfunction

" 为当前窗口高亮 TODO/FIXME 等标记（每个窗口只挂一次）
function! s:HighlightTodo() abort
    if exists('w:todo_match')
        return
    endif
    let w:todo_match = matchadd('Todo', '\<\(TODO\|FIXME\|HACK\|NOTE\|XXX\)\>')
endfunction
