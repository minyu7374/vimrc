local ss = require('smart-splits')
local backend

-- 显式选择内层复用器，避免操作外层 Kitty。
if vim.env.HERDR_PANE_ID and vim.env.HERDR_PANE_ID ~= '' then
    backend = 'smart-splits-backend-herdr'
elseif vim.env.TMUX and vim.env.TMUX ~= '' then
    backend = 'smart-splits-backend-tmux'
elseif vim.env.KITTY_LISTEN_ON and vim.env.KITTY_LISTEN_ON ~= '' then
    backend = 'smart-splits-backend-kitty'
end

ss.setup({
    -- 缺省移动/缩放步长(与 keys.vim 的 resize 步长语义接近)
    resize = { amount = 3 },
    -- 到达边缘时停止而非环绕
    move = { at_edge = 'stop' },
    mux = { backend = backend },
})

-- 面板跳转:对齐 keys.vim 的 <C-hjkl>;在 vim 分屏边缘会自动跳到 tmux/kitty 面板
vim.keymap.set('n', '<C-h>', ss.move_cursor_left,  { silent = true })
vim.keymap.set('n', '<C-j>', ss.move_cursor_down,  { silent = true })
vim.keymap.set('n', '<C-k>', ss.move_cursor_up,    { silent = true })
vim.keymap.set('n', '<C-l>', ss.move_cursor_right, { silent = true })
vim.keymap.set('n', '<C-\\>', '<cmd>wincmd p<cr>', { silent = true })

-- 窗口缩放(新增键位,不与既有 =/-/</> 冲突)
vim.keymap.set('n', '<A-h>', ss.resize_left,  { silent = true })
vim.keymap.set('n', '<A-j>', ss.resize_down,  { silent = true })
vim.keymap.set('n', '<A-k>', ss.resize_up,    { silent = true })
vim.keymap.set('n', '<A-l>', ss.resize_right, { silent = true })
