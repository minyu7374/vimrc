let s:conf_root = expand('~/.vim.d/')

function! s:Load(module)
  execute 'source ' . fnameescape(s:conf_root . a:module . '.vim')
endfunction

call s:Load('basic')
call s:Load('autocmd')
call s:Load('keys')
if has('mac')
    call s:Load('mac')
endif

call s:Load('plug_load')
call s:Load('plug_conf/coc')
call s:Load('plug_conf/common')
call s:Load('plug_conf/' . (has('nvim') ? 'nvim-spec' : 'vim-spec'))
