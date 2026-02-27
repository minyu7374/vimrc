" 通用函数：返回列表中第一个存在的路径（文件、目录、软链接等均可）
function! s:find_first_path(paths)
    for l:path in a:paths
        let l:expanded = expand(l:path) " 兼容特殊符号和环境变量，如~
        if !empty(getftype(l:expanded)) " getftype 为空表示路径不存在
            return l:expanded
        endif
    endfor
    return ''
endfunction

" set rtp+='/opt/local/share/fzf/vim' " MacPorts下路径rong
" 兼容可能的 fzf 路径（包含 Homebrew ARM/Intel 和 MacPorts）
let s:fzf_path = s:find_first_path(['/opt/local/share/fzf/vim', '/opt/homebrew/opt/fzf', '/usr/local/opt/fzf'])
if !empty(s:fzf_path)
    execute 'set rtp+=' . s:fzf_path
endif
