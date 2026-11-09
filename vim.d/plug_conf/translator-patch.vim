" vim-translator 的安装/更新兼容修正，由 plug_load.vim 的 Vim 分支加载。

function! VimrcPatchTranslatorGoogle(info) abort
    " vim-plug 延后调用 hook，使用全局前缀函数，避免 lambda 丢失 s: 作用域。
    " Google 的候选释义可为 null，不能因此丢掉已返回的正文译文。
    " 安装/更新后修正这一行；重复运行不会再次改写已修正的脚本。
    let l:file = g:plugs[a:info.name].dir . '/script/translator.py'
    let l:lines = readfile(l:file)
    let l:start = index(l:lines, '    def get_alternative(self, resp):')
    if l:start < 0
        return
    endif
    for l:index in range(l:start, len(l:lines) - 1)
        if l:lines[l:index] ==# '            for i in x[2]:'
            let l:lines[l:index] = '            for i in (x[2] or []):'
            call writefile(l:lines, l:file)
            break
        endif
        if l:lines[l:index] ==# '        return result'
            break
        endif
    endfor
endfunction
