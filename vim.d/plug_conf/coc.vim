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
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

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
nnoremap <leader>el :CocDiagnostics<CR>
nnoremap <leader>ep <Plug>(coc-diagnostic-prev)
nnoremap <leader>en <Plug>(coc-diagnostic-next)
nnoremap <silent> [e <Plug>(coc-diagnostic-prev)
nnoremap <silent> ]e <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)

" show documentation in preview window.
nnoremap <silent> gk :call <SID>show_documentation()<CR>

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
nnoremap <leader>cr <Plug>(coc-rename)

augroup coc_group
  autocmd!
  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')
  " Setup formatexpr specified filetype(s).
  autocmd FileType c,cpp,go,python,sql setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
xnoremap <leader>cas <Plug>(coc-codeaction-selected)
nnoremap <leader>cas <Plug>(coc-codeaction-selected)

" Renoremap keys for applying codeAction to the current buffer.
nnoremap <leader>caa  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nnoremap <leader>caf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xnoremap if <Plug>(coc-funcobj-i)
onoremap if <Plug>(coc-funcobj-i)
xnoremap af <Plug>(coc-funcobj-a)
onoremap af <Plug>(coc-funcobj-a)
xnoremap ic <Plug>(coc-classobj-i)
onoremap ic <Plug>(coc-classobj-i)
xnoremap ac <Plug>(coc-classobj-a)
onoremap ac <Plug>(coc-classobj-a)

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
" nnoremap <silent> <C-s> <Plug>(coc-range-select)
xnoremap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Formatting selected code.
xnoremap <leader>cs  <Plug>(coc-format-selected)<CR>
nnoremap <leader>cs  <Plug>(coc-format-selected)<CR>
nnoremap <leader>cf :Format<CR>
nnoremap <leader>cz :Fold<CR>
nnoremap <leader>ci :OR<CR>

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
    \ 'coc-basedpyright',
    \ 'coc-go',
    \ 'coc-clangd',
    \ 'coc-snippets',
    \ 'coc-pairs',
    \ 'coc-markdownlint',
    \ 'coc-sh',
    \ 'coc-sql',
    \ 'coc-vimlsp',
    \]

" 结合direnv环境变量控制在不同项目目录下自动格式化的行为
" coc-setting.conf中不再设置 coc.preferences.formatOnSaveFiletypes
augroup format_on_save_group
    au!
    autocmd BufWritePre *.go,*.rs :call CocAction('format')
    if $FORMAT_ON_SAVE !=# 'false'
        autocmd BufWritePre *.c,*.cpp,*.h,*.py,*.sql :call CocAction('format')
    endif
augroup end

""" coc-snippets
" Use <C-l> for trigger snippet expand.
inoremap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vnoremap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for both expand and jump (make expand higher priority.)
inoremap <C-j> <Plug>(coc-snippets-expand-jump)

" convert visual selected code to snippet
xnoremap <leader>cx  <Plug>(coc-convert-snippet)

""" coc-git
" navigate chunks of current buffer
nnoremap [g <Plug>(coc-git-prevchunk)
nnoremap ]g <Plug>(coc-git-nextchunk)
" navigate conflicts of current buffer
nnoremap [c <Plug>(coc-git-prevconflict)
nnoremap ]c <Plug>(coc-git-nextconflict)
" show chunk diff at current position
nnoremap gs <Plug>(coc-git-chunkinfo)
" show commit contains current position
nnoremap gc <Plug>(coc-git-commit)
" create text object for git chunks
onoremap ig <Plug>(coc-git-chunk-inner)
xnoremap ig <Plug>(coc-git-chunk-inner)
onoremap ag <Plug>(coc-git-chunk-outer)
xnoremap ag <Plug>(coc-git-chunk-outer)

" """ ale  (有coc，就完全不用ale了)
"" The easiest way to get both plugins to work together is to configure coc.nvim to send diagnostics to ALE, so ALE controls how all problems are presented to you, and to disable all LSP features in ALE, so ALE doesn't try to provide LSP features already provided by coc.nvim, such as auto-completion.
"" Open your coc.nvim configuration file with :CocConfig and add "diagnostic.displayByAle": true to your settings.
"" Add let g:ale_disable_lsp = 1 to your vimrc file, before plugins are loade
"" 方案选择: 正常使用coc的功能(不向ale传递诊断信息)；默认不开启ale，同时关闭ale的lsp特性，不必提供coc提供过的功能
"let g:ale_enabled = 0
"let g:ale_disable_lsp = 1
"
"" 常用命令映射
"nnoremap <leader>te :ALEToggle<CR>
"nnoremap ej <Plug>(ale_next)
"nnoremap ek <Plug>(ale_previous)
"
"" 指定启用的linters
"let g:ale_linters = {
"            \  'c': ['clang'],
"            \  'cpp': ['clang++'],
"            \  'go': ['golint', 'gopls'],
"            \  'php': ['php -l'],
"            \  'sh': ['shellcheck'],
"            \  'bash': ['shellcheck'],
"            \  'awk': ['awk'],
"            \  'lua': ['luacheck'],
"            \  'sql': ['sqlint'],
"            \  'python': ['pylint'],
"            \  'markdown': ['mdl'],
"            \  'vim': ['vint'],
"            \  'html': [],
"            \  'txt': [],
"            \}
"
"" ale行为控制
"" " run linters only when I save files
"" let g:ale_lint_on_text_changed = 'never'
"" let g:ale_lint_on_insert_leave = 0
"" " don't want linters to run on opening a file
"" let g:ale_lint_on_enter = 0
"
"" " use the quickfix list or the loclist
"" let g:ale_set_quickfix = 1
"" let g:ale_set_loclist = 0
"
"" show Vim windows for the loclist or quickfix items when a file contains warnings or errors
"" let g:ale_open_list = 1
"" keep the window open even after errors disappear
""let g:ale_keep_list_window_open = 1
"
"" 始终开启标志列设置
"" let g:ale_sign_column_always = 1
"
"" 取消错误处高亮
"" let g:ale_set_highlights = 0
"
"" " If emoji not loaded, use default sign
"" try
"    " "let g:ale_sign_error = emoji#for('boom')
"    " let g:ale_sign_error = emoji#for('eight_pointed_black_star')
"    " let g:ale_sign_warning = emoji#for('small_orange_diamond')
"" catch
"    " let g:ale_sign_error = '✴'
"    " let g:ale_sign_warning = '⚠'
"" endtry
"let g:ale_sign_error = '✴'
"let g:ale_sign_warning = '⚠'
"let g:ale_echo_msg_format = '[%linter%] %severity% %s'
"let g:ale_statusline_format = ['E•%d', 'W•%d', 'OK']
"
"" 标记的背景色调整，ALE之前warning默认用的todo太抢眼了
"" highlight clear ALEErrorSign
"" highlight clear ALEWarningSign
"highlight link ALEErrorSign ErrorMsg
"highlight link ALEWarningSign WarningMsg
"
"" For a more fancy ale statusline
"function! ALEGetError()
"    let l:res = ale#statusline#Status()
"    if l:res ==# 'OK'
"        return ''
"    else
"        let l:e_w = split(l:res)
"        if len(l:e_w) == 2 || match(l:e_w, 'E') > -1
"            return ' •' . matchstr(l:e_w[0], '\d\+') .' '
"        endif
"    endif
"endfunction
"
"function! ALEGetWarning()
"    let l:res = ale#statusline#Status()
"    if l:res ==# 'OK'
"        return ''
"    else
"        let l:e_w = split(l:res)
"        if len(l:e_w) == 2
"            return ' •' . matchstr(l:e_w[1], '\d\+')
"        elseif match(l:e_w, 'W') > -1
"            return ' •' . matchstr(l:e_w[0], '\d\+')
"        endif
"    endif
"endfunction
"
"let g:ale_echo_msg_error_str = '✴'
"let g:ale_echo_msg_warning_str = '⚠'
"
"" Set this. Airline will handle the rest.
"let g:airline#extensions#ale#enabled = 1
