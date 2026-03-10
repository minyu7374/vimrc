-- 设置运行时路径，包含 vim 配置
-- vim.opt.runtimepath:append(vim.fn.expand('~/.vim'))
-- vim.opt.runtimepath:append(vim.fn.expand('~/.vim/after'))

-- 加载基础配置（复用现有 vimscript）
vim.cmd('source ~/.vim.d/basic.vim')
vim.cmd('source ~/.vim.d/autocmd.vim')
vim.cmd('source ~/.vim.d/keys.vim')

if vim.fn.has('mac') == 1 then
  vim.cmd('source ~/.vim.d/mac.vim')
end

-- 初始化 lazy.nvim
require('lazy-boot')
require('lazy').setup('plugins')

-- 加载插件配置（在 lazy.nvim 加载完成后）
vim.api.nvim_create_autocmd('User', {
  pattern = 'LazyDone',
  callback = function()
    -- 加载 coc.nvim 配置
    vim.cmd('source ~/.vim.d/plug_conf/coc.vim')

    -- 加载通用插件配置
    vim.cmd('source ~/.vim.d/plug_conf/common.vim')

    -- 加载 nvim 专用配置
    vim.cmd('source ~/.vim.d/plug_conf/nvim-spec.vim')

    -- 补充 lua 配置
    require('plug_conf.nvim-tree')
    require('plug_conf.nvim-treesitter')
    require('plug_conf.avante')
  end,
})
