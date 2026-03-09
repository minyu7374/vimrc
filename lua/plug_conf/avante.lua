require('avante').setup({
  -- 指定 input provider
  input = {
    provider = "dressing",  -- 或 "snacks"，别用 "native"
  },
  
  -- 指定 selector provider，绕开 dressing 的 list 校验
  selector = {
    provider = "telescope",   -- 推荐，或 "fzf_lua" / "mini"
    -- provider = "snacks",   -- 如果装了 snacks.nvim
  },
})
