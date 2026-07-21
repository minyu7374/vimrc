-- flash.nvim: nvim 跳转，覆盖 vim 基线 vim-sneak；s 触发
require('flash').setup({})

local map = vim.keymap.set
-- s 跳转（对齐 sneak 的 s，flash.jump 双向带标签，向后跳也由 s 覆盖）
map({ 'n', 'x', 'o' }, 's', function() require('flash').jump() end, { desc = 'Flash 跳转' })
-- S 走 treesitter 结点选择（sneak 的 S 是向后跳，这里语义不同，见 risks）
map({ 'n', 'x', 'o' }, 'S', function() require('flash').treesitter() end, { desc = 'Flash Treesitter' })
