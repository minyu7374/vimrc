""" ChatGPT
if $USER != 'root'
    lua require('plug_conf/chatgpt')
    noremap <leader>ac :ChatGPT<CR>
    noremap <leader>ae :ChatGPTEditWithInstruction<CR>
    noremap <leader>ag :ChatGPTRun grammar_correction<CR>
    noremap <leader>at :ChatGPTRun translate<CR>
    noremap <leader>ak :ChatGPTRun keywords<CR>
    noremap <leader>ad :ChatGPTRun docstring<CR>
    noremap <leader>aa :ChatGPTRun add_tests<CR>
    noremap <leader>ao :ChatGPTRun optimize_code<CR>
    noremap <leader>as :ChatGPTRun summarize<CR>
    noremap <leader>af :ChatGPTRun fix_bugs<CR>
    noremap <leader>ax :ChatGPTRun explain_code<CR>
    noremap <leader>ar :ChatGPTRun roxygen_edit<CR>
    noremap <leader>al :ChatGPTRun code_readability_analysis<CR>
endif

""" nvim-tree
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

" lua require('nvim-tree').setup()
lua require('plug_conf/nvim-tree')
noremap <leader>tt :NvimTreeToggle<CR>

" 参考nerdtree
augroup nvimtree_group
    au!
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if (argc() == 0 && !exists('s:std_in') && v:this_session == '') | execute 'NvimTreeFocus' | endif
augroup end

""" nvim-treesitter 高亮强化
lua require('plug_conf/nvim-treesitter')

""" 折叠使用treesitter
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

""" telescope
lua require('telescope').load_extension('fzf')
" Find files using Telescope command-line sugar.
nnoremap <silent><nowait> <leader><leader>f  :<C-u>Telescope<CR>
nnoremap <leader>fo <cmd>Telescope<CR>
nnoremap <leader>ff <cmd>Telescope find_files<CR>
" 添加Esc键，方便直接进行选择
nnoremap <leader>fg <cmd>Telescope grep_string<CR><Esc>
nnoremap <leader>fv <cmd>Telescope live_grep<CR>
nnoremap <leader>fb <cmd>Telescope buffers<CR>
nnoremap <leader>fh <cmd>Telescope help_tags<CR>

""" Telescope-coc
lua require('telescope').load_extension('coc')
nnoremap <silent><nowait> <leader><leader>c  :<C-u>Telescope coc<CR>
" Show all diagnostics.
nnoremap <silent><nowait> <leader><leader>e  :<C-u>Telescope coc diagnostics<CR>
" Show commands.
nnoremap <silent><nowait> <leader><leader>m  :<C-u>Telescope coc commands<CR>
nnoremap <silent><nowait> <leader>:  :<C-u>Telescope coc commands<CR>
" Find symbol of current document.
nnoremap <silent><nowait> <leader><leader>o  :<C-u>Telescope coc document_symbols<CR>
" Search workspace symbols.
nnoremap <silent><nowait> <leader><leader>s  :<C-u>Telescope coc workspace_symbols<CR>
