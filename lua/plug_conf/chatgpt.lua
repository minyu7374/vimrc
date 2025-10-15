require("chatgpt").setup {
    -- api_host_cmd 方式一直没成功，先直接将OPENAI_API_HOST环境变量配置成chatanywhere的了
    -- api_host_cmd = 'echo -n "${CHATANYWHERE_API_HOST:-api.chatanywhere.tech}"',
    api_key_cmd = 'pass chatanywhere/token',
    openai_params = {
        model = "gpt-4o-mini",
    },
    openai_edit_params = {
        model = "gpt-4o-mini",
    },
}
