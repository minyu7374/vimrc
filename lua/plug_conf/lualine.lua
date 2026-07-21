require("lualine").setup {
    options = {
        -- theme='auto' 会跟随当前 colorscheme(doom-one)自动生成配色，
        -- 与 vim 侧 airline 的 onedark 语义对齐(同为深色主题)
        theme = "auto",
    },
    sections = {
        -- 诊断读 coc(本仓库用 coc.nvim 而非原生 LSP)，对齐 vim 侧 coc#status 的错误/警告计数
        lualine_b = { "branch", "diff", { "diagnostics", sources = { "coc" } } },
        -- filename 后接 aerial 的当前符号路径(基于 treesitter)，对齐 vim 侧 vista 的 NearestMethodOrFunction
        lualine_c = { "filename", "aerial" },
    },
}
