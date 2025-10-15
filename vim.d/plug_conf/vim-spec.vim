""" nerdtree
noremap <leader>tt :NERDTreeToggle<CR>
augroup nerdtree_group
    au!
    " Start NERDTree, unless a file or session is specified, eg. vim -S session_file.vim.
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if (argc() == 0 && !exists('s:std_in') && v:this_session == '') | execute 'NERDTree' | endif
    " Close the tab if NERDTree is the only window remaining in it.
    autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
augroup end
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']

""" clap
nnoremap <silent><nowait> <leader><leader>f  :<C-u>Clap<CR>
nnoremap <leader>fo <cmd>Clap<CR>
nnoremap <leader>ff <cmd>Clap files<CR>
nnoremap <leader>fg <cmd>Clap grep ++query=<cword><CR>
nnoremap <leader>fv <cmd>Clap live_grep<CR>
nnoremap <leader>fb <cmd>Clap buffers<CR>
nnoremap <leader>fh <cmd>Clap help_tags<CR>

""" coc-clap
" Show all diagnostics.
nnoremap <silent><nowait> <leader><leader>e  :<C-u>Clap coc_diagnostics<CR>
" Manage extensions.
nnoremap <silent><nowait> <leader><leader>X  :<C-u>CocList extensions<CR>
" Show commands.
nnoremap <silent><nowait> <leader><leader>m  :<C-u>Clap coc_commands<CR>
nnoremap <silent><nowait> <leader>:  :<C-u>Clap coc_commands<CR>
" Find symbol of current document.
nnoremap <silent><nowait> <leader><leader>o  :<C-u>Clap coc_outline<CR>
" Search workspace symbols.
nnoremap <silent><nowait> <leader><leader>s  :<C-u>Clap coc_symbols<CR>
