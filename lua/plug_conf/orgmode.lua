require('orgmode').setup({
    org_agenda_files = '~/org/**/*',
    org_default_notes_file = '~/org/refile.org',
    -- keys.vim 的 <leader>o/<leader>O 带 nowait,会屏蔽 <leader>o 开头的两键序列,
    -- 因此 org agenda/capture 改用未被占用的 <leader>n* 前缀(见 risks)
    mappings = {
        global = {
            org_agenda = '<leader>na',
            org_capture = '<leader>nc',
        },
    },
})
