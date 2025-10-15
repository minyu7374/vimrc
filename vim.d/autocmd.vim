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

augroup end
