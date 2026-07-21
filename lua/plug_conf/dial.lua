-- dial.nvim: nvim 数字/十六进制/布尔/日期/时间/semver 增减，覆盖 vim 基线 vim-speeddating
local augend = require('dial.augend')
require('dial.config').augends:register_group({
    default = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.date.alias['%Y/%m/%d'], -- 对齐 keys.vim 插入的日期格式
        augend.date.alias['%H:%M'],
        augend.constant.alias.bool,
        augend.semver.alias.semver,
    },
})

-- keys.vim 将 g=/g- 映射到 <C-A>/<C-X>；nvim 侧改到 dial
-- 本文件经 nvim-spec.vim 在 keys.vim 之后 require，可覆盖 g=/g-
local dmap = require('dial.map')
vim.keymap.set('n', 'g=', function() dmap.manipulate('increment', 'normal') end, { desc = 'dial +' })
vim.keymap.set('n', 'g-', function() dmap.manipulate('decrement', 'normal') end, { desc = 'dial -' })
vim.keymap.set('x', 'g=', function() dmap.manipulate('increment', 'visual') end, { desc = 'dial +' })
vim.keymap.set('x', 'g-', function() dmap.manipulate('decrement', 'visual') end, { desc = 'dial -' })
