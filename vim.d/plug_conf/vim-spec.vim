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

""" fzf
" 开启悬浮窗样式 (需要 Vim 8.2+ 且支持 popupwin)
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8, 'relative': v:true } }
" 设置预览窗口（模仿 Telescope/Clap 的侧边/上方预览）
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" 全局入口
nnoremap <silent><nowait> <leader><leader>f :FZF<CR>
nnoremap <leader>fo :FZF<CR>
" 文件搜索
nnoremap <leader>ff :Files<CR>
" 光标下单词搜索
nnoremap <leader>fg :Rg <C-R><C-W><CR>
" 实时搜索
nnoremap <leader>fv :Rg<CR>
" 缓冲区搜索
nnoremap <leader>fb :Buffers<CR>
" 帮助文档
nnoremap <leader>fh :Help<CR>

""" coc-fzf
nnoremap <silent><nowait> <leader><leader>c :CocFzfList<CR>
" 显示所有诊断信息 (Diagnostics)
nnoremap <silent><nowait> <leader><leader>e :CocFzfList diagnostics<CR>
" 显示命令 (Commands)
nnoremap <silent><nowait> <leader><leader>m :CocFzfList commands<CR>
nnoremap <silent><nowait> <leader>: :CocFzfList commands<CR>
" 当前文档大纲 (Outline)
nnoremap <silent><nowait> <leader><leader>o :CocFzfList outline<CR>
" 搜索工作区符号 (Symbols)
nnoremap <silent><nowait> <leader><leader>s :CocFzfList symbols<CR>
