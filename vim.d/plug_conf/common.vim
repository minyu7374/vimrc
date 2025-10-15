""" WhichKey
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader>      :<c-u>WhichKeyVisual '<Space>'<CR>
nnoremap <silent> <leader><leader>h     :<c-u>WhichKey ''<CR>
vnoremap <silent> <leader><leader>h      :<c-u>WhichKey ''<CR>
" By default timeoutlen is 1000 ms
set timeoutlen=500

" call which_key#register('<Space>', "g:which_key_map")
" let g:which_key_map =  { 'a' : { "name": "+AI" } }

""" colorscheme
" :execute 'colorscheme' has('mac') ? 'duskfox' : 'nordfox'

" let g:onedark_color_overrides = {
            " \ "background": {"gui": "#272b35", "cterm": "235", "cterm16": "3" },
            " \ "purple": { "gui": "#C678DF", "cterm": "170", "cterm16": "5" }
            " \}
" if !empty($STY) && !has("gui_running")
  " " 针对 GNU screen，设置透明背景，避免色彩展示问题（screen会设置STY环境变量）
  " augroup colorset
    " autocmd!
    " let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    " autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  " augroup END
" endif
" if has("nvim")
    " let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" endif
" colorscheme onedark
set termguicolors

colorscheme doom-one
let g:doom_one_terminal_colors = v:true

" 光标所在行的背景颜色与屏幕上其他可见行的背景颜色相同
set cursorlineopt=screenline
" 在光标所在行上绘制一条水平线，使其更易于区分
set cursorline

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
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

""" copilot
" 默认不开启
let g:copilot_enabled = 0

" Copilot 开关
function! ToggleCopilot()
  if get(g:, 'copilot_enabled', 0)
    Copilot disable
    let g:copilot_enabled = 0
    echo "Copilot Disabled"
  else
    Copilot enable
    let g:copilot_enabled = 1
    echo "Copilot Enabled"
  endif
endfunction
nnoremap <leader>tC :call ToggleCopilot()<CR>

" 新加shift+tab快捷键映射到 copilot#Accept, 作为tab键不可用时的备用组合键（比如在nui浮动窗口中tab键用于切换窗口了）
inoremap <silent><nowait><expr>         <S-Tab> copilot#Accept(' . tab_fallback . ')

" """ vim-go
" let g:go_def_mode='gopls'
" let g:go_info_mode='gopls'

""" markdown
" let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_folding_level = 6
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_math = 1
" restrict text emphasis to a single line
"let g:vim_markdown_emphasis_multiline = 0
"let g:vim_markdown_frontmatter = 1
" need vim-toml
"let g:vim_markdown_toml_frontmatter = 1
" need vim-json
"let g:vim_markdown_json_frontmatter = 1
"let g:vim_markdown_new_list_item_indent = 2

""" 注释
" 注释时自动加一个空格
let g:NERDSpaceDelims=1
" python 设置成0时就会有空格，设成1反而多了一个空格
" autocmd FileType python :let g:NERDSpaceDelims=0
" 取消注释后空行中的空格删除
let g:NERDTrimTrailingWhitespace=1

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

""" indentline
let g:indentLine_enabled = 0

autocmd FileType python,json IndentLinesEnable
nnoremap <leader>ti :IndentLinesToggle<CR>

""" easymotion
let g:EasyMotion_smartcase = 1

nnoremap s <Plug>(easymotion-s2)
nnoremap t <Plug>(easymotion-t2)

noremap  / <Plug>(easymotion-sn)
onoremap / <Plug>(easymotion-tn)

noremap <leader>j <Plug>(easymotion-j)
noremap <leader>k <Plug>(easymotion-k)
noremap <leader>h <Plug>(easymotion-linebackward)
noremap <leader>l <Plug>(easymotion-lineforward)
noremap <leader>. <Plug>(easymotion-repeat)

""" git
noremap <leader>gs :Git status<CR>
noremap <leader>gc :Git commit<CR>
noremap <leader>gC :Git commit -v<CR>
noremap <leader>gp :Git push<CR>

noremap <leader>ga :Git add %<CR>
noremap <leader>gr :Gread<CR>
noremap <leader>gw :Gwrite<CR>
noremap <leader>gm :GMove<CR>
noremap <leader>gd :GDelete<CR>

noremap <leader>gg :Ggrep<space>
noremap <leader>gv :Gvdiffsplit<CR>
noremap <leader>gV :Gvdiffsplit<space>

""" rainbow
let g:rainbow_active = 1

""" undotree
nnoremap <nowait> <leader>u :UndotreeToggle<CR>

""" tabular 指定字符对齐文本
vnoremap <leader>tl :Tabular /

""" bullets 自动列表
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit'
    \]

""" floatterm
let g:floaterm_keymap_new = '<leader>ft'
let g:floaterm_keymap_prev = '<leader>fk'
let g:floaterm_keymap_next = '<leader>fj'
let g:floaterm_keymap_toggle = '<leader>tf'

""" tmux 相关
" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigjtor_save_on_switch = 1
