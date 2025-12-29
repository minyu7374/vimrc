require'nvim-treesitter'.setup {
    -- one of "all", "language", or a list of languages
    ensure_installed = {'bash', 'awk', 'c', 'cpp', 'go', 'haskell', 'lua', 'python', 'sql', 'html', 'json'},
    auto_install = true,
    highlight = {
        enable = true,              -- false will disable the whole extension
        --disable slow treesitter highlight for large files
        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },

    -- 增量选择有bug，暂时不用
    -- incremental_selection = {
    --     enable = true,
    --     keymaps = {
    --       init_snlection = "<CR>",   -- set to `false` to disable one of the mappings
    --       node_incremental = "<CR>",
    --       scope_incremental = "<BS>",
    --       node_decremental = "<TAB>",
    --     },
    -- },

    -- Indentation based on treesitter for the = operator. NOTE: This is an experimental feature.
    -- 实测大json文件很卡，禁用掉
    indent = {
        enable = false,              -- false will disable the whole extension
    },
}
