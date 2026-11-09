local pantran = require('pantran')

pantran.setup({
    default_engine = 'google',
    engines = {
        google = {
            -- Google API 和无密钥后端的配置独立，目标语言都设为简体中文。
            default_target = 'zh-CN',
            fallback = { default_target = 'zh-CN' },
        },
    },
    -- 与 lazyvim-config 一致，左右显示原文与译文，便于阅读段落。
    ui = { width_percentage = 0.8, height_percentage = 0.6 },
})

-- motion_translate 返回 g@；补上 iw，保留普通模式直接查词。
vim.keymap.set('n', '<leader>yt', function()
    return pantran.motion_translate() .. 'iw'
end, { expr = true, desc = 'Translate Word' })
vim.keymap.set('x', '<leader>yt', pantran.motion_translate, { expr = true, desc = 'Translate Selection' })
