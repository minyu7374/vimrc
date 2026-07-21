require('aerial').setup({
    -- 本仓库 nvim 用 coc.nvim(非原生 LSP),coc 符号 aerial 读不到;
    -- 故走 treesitter 后端(nvim 已装 nvim-treesitter)
    backends = { 'treesitter', 'markdown', 'man' },
    layout = {
        default_direction = 'right',
    },
})
