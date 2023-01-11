# vimrc

现代化(neo)vim设置

## 依赖

- vim: `+python` `+lua` 支持
    - `lua` 支持最好使用 `luajit`（lua 5-1 之上的版本对部分插件可能会有不兼容，Gentoo里可配置USE flags: LUA_SINGLE_TARGET luajit）
- nvim: `pip` 安装 `pynvim` 支持
- 代码补全/静态检查等(可按需安装):
    - python：`pyright`
    - go: `golint` `gopls` `gofmt`
    - sh: `shellcheck`
    - python: `flake8`
    - markdown: `markdownlint`

## 配置内容

### 基础配置

- 全局配置
    - `leader` 键设置为 `,`
    - `python` 路径设置
- 编码相关
    - 自动判断编码尝试顺序
    - 中文折行优化
- 文件类型支持
- 显示类
    - 去除启动界面
    - 行号显示
    - 是否默认折行
    - 快捷键默认显示执行命令
- 缩进
    - 习惯使用4个空格而不是 `Tab`
- 搜索匹配语法高亮相关
    - 开启语法高亮
    - 搜索替换体验优化
- 一些特性
    - 去除vi兼容
    - 插入模式可使用`backspce`
    - 禁用鼠标
- 文件读写
    - 共享外部系统剪贴板
    - 文件自动载入外部更新
    - 文件保存、缓存、备份等行为调整
- 自动补全相关
    - 优化补全菜单行为

### autocmd自动操作

- 特定文件类型执行
    - 绑定快捷键使用系统默认软件打开当前文件
    - 针对python文件，设置快捷键按缩进折叠
- 光标恢复到上次操作文件位置

### 按键映射

- 一些方便使用的短命令/小功能
    - 重新加载vimrc配置
    - 插入空行
    - 文件打开保存操作
    - 插入当前时间
    - ...
- tab新建、切换等常用操作
- 复制粘贴操作
- panel新建、切换、调整等相关操作

### 插件

- nightfox 配色方案
- airline 状态栏美化
- coc.nvim 代码补全工具
    - Tab键除了自动补全外添加了对代码片段工具(使用`coc-snippets`)的兼容
    - 一些配置调整在`cocsettings.json`里
    - 使用了`coc-git`、`coc-floaterm`等扩展
- ale 异步语法检查
    - ale和coc共用的方案选择: 正常使用coc的功能(不向ale传递代码诊断信息)；默认不开启ale，同时关闭ale的lsp特性，不必提供coc提供过的功能
- vim-{toml,json,orgmode,markdown} `toml`、`json`、`Org-Mode`、`markdown` 等支持
- indentLine 缩进对齐提示，主要是python使用
- nerdcommenter 代码注释
- NERDTree 文件管理
- vista tagbar替代品
- vim-easymotion 快速跳转
- vim-fugitive 强大的`git`工具
- rainbow 括号等匹配以不同颜色显示
- undotree undo优化
- tabular 指定字符对齐文本
- bullets 自动列表
- vim-tmux-navigator `vim`和`tmux`面板无缝跳转
- fcitx.nvim 自动输入法切换，优化体验
- vim-floatterm shell浮动窗口
- nvim-treesitter 高亮强化(nvim才能用)
- 现代化模糊查找工具
    - nvim: telescope.nvim
    - vim: vim-clap
