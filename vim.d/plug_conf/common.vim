" By default timeoutlen is 1000 ms
set timeoutlen=500

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

" ctrl+/, 作为tab键不可用时的备用组合键（比如在nui浮动窗口中tab键用于切换窗口了）
inoremap <silent><nowait><expr>         <C-_> copilot#Accept("\<CR>")

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

""" 注释 (vim-commentary): gcc/gc 开箱即用; 同时添加 <leader>c<Space>
nmap <leader>c<Space> <Plug>CommentaryLine
xmap <leader>c<Space> <Plug>Commentary

""" indentline
let g:indentLine_enabled = 0

autocmd FileType python,json IndentLinesEnable
nnoremap <leader>ti :IndentLinesToggle<CR>

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

""" undotree
nnoremap <nowait> <leader>u :UndotreeToggle<CR>

""" vim-easy-align 交互式对齐 (替代 tabular)
" 可视模式选中后 ga, 或普通模式 ga + 动作 (如 gaip=) 触发
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

""" bullets 自动列表
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit'
    \]
