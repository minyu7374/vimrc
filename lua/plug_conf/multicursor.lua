-- multicursor.nvim: nvim 多光标，覆盖 vim 基线 vim-visual-multi
-- 注意：运行时模块名是 multicursor-nvim（连字符）
local mc = require('multicursor-nvim')
mc.setup()

local set = vim.keymap.set
-- 对齐 VM: <C-n> 选中光标下单词/选区并向下逐个添加匹配
set({ 'n', 'x' }, '<C-n>', function() mc.matchAddCursor(1) end, { desc = '多光标: 下一个匹配' })
-- 对齐 VM: <C-Up>/<C-Down> 上下逐行添加光标
set({ 'n', 'x' }, '<C-Up>', function() mc.lineAddCursor(-1) end, { desc = '多光标: 上一行' })
set({ 'n', 'x' }, '<C-Down>', function() mc.lineAddCursor(1) end, { desc = '多光标: 下一行' })
-- 对齐 VM 全选: 为文档中所有匹配添加光标
set({ 'n', 'x' }, '<leader>A', mc.matchAllAddCursors, { desc = '多光标: 全部匹配' })

-- 仅在存在多光标时生效的按键层（不污染全局映射）
mc.addKeymapLayer(function(layerSet)
    -- 在光标间切换主光标
    layerSet({ 'n', 'x' }, '<left>', mc.prevCursor)
    layerSet({ 'n', 'x' }, '<right>', mc.nextCursor)
    -- 删除当前主光标
    layerSet({ 'n', 'x' }, '<leader>x', mc.deleteCursor)
    -- <esc>: 先禁用则重新启用，否则清空所有光标
    layerSet('n', '<esc>', function()
        if not mc.cursorsEnabled() then
            mc.enableCursors()
        else
            mc.clearCursors()
        end
    end)
end)

-- 高亮跟随主题
local hl = vim.api.nvim_set_hl
hl(0, 'MultiCursorCursor', { reverse = true })
hl(0, 'MultiCursorVisual', { link = 'Visual' })
hl(0, 'MultiCursorSign', { link = 'SignColumn' })
hl(0, 'MultiCursorMatchPreview', { link = 'Search' })
hl(0, 'MultiCursorDisabledCursor', { reverse = true })
hl(0, 'MultiCursorDisabledVisual', { link = 'Visual' })
hl(0, 'MultiCursorDisabledSign', { link = 'SignColumn' })
