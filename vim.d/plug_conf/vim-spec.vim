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
" 剪贴历史 (Yank, 需 coc-yank)
nnoremap <silent><nowait> <leader><leader>y :CocFzfList yank<CR>

""" WhichKey (仅 vim: vim-which-key 需要显式触发映射)
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

""" airline
" deus/dark/onedark/solarized/tomorrow
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
" let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

""" vim-sneak 双字符跳转 (s/S), 替代 easymotion
" 跟随 ignorecase/smartcase
let g:sneak#use_ic_scs = 1
" 标签模式
let g:sneak#label = 1

""" rainbow
let g:rainbow_active = 1

""" vista(tagbar)
noremap <leader>tv :Vista!!<CR>

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

augroup vista_group
    au!
    " By default vista.vim never run if you don't call it explicitly.
    " show the nearest function in your statusline automatically
    autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
augroup end

" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works for the kind renderer, not the tree renderer.
let g:vista_icon_indent = ['╰─▸ ', '├─▸ ']

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'coc'

" Set the executive for some filetypes explicitly. Use the explicit executive
" instead of the default one for these filetypes when using `:Vista` without
" specifying the executive.
let g:vista_executive_for = {
      \ }

" Declare the command including the executable and options used to generate ctags output
" for some certain filetypes.The file path will be appened to your custom command.
let g:vista_ctags_cmd = {
      \ 'haskell': 'hasktags -x -o - -c',
      \ }

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
let g:vista_fzf_preview = ['right:50%']

""" floatterm
let g:floaterm_keymap_new = '<leader>ft'
let g:floaterm_keymap_prev = '<leader>fk'
let g:floaterm_keymap_next = '<leader>fj'
let g:floaterm_keymap_toggle = '<leader>tf'

""" tmux 相关
" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 1
