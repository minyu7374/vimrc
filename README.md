# vimrc

现代化(neo)vim设置。同一套配置同时支持 **vim 与 nvim**：以 vim 为基线，nvim 在同类能力上用更强的原生插件覆盖，键位保持一致。

## 依赖

- vim: `+python` `+lua` 支持
    - `lua` 支持最好使用 `luajit`（lua 5-1 之上的版本对部分插件可能会有不兼容，Gentoo里可配置USE flags: LUA_SINGLE_TARGET luajit）
- nvim: 安装 `pynvim` 支持；aerial/orgmode 需 nvim 0.11+
- 代码补全/静态检查等(coc 扩展会按需自动安装，外部工具可按需装):
    - python：`basedpyright`
    - go: `gopls` `gofmt`
    - sh: `shellcheck`
    - markdown: `markdownlint`

## 安装

`./install.sh [vim|nvim]`（默认 `vim`）把配置软链到对应编辑器目录，并装好 vim-plug 与 Copilot、创建 spell 词库目录。之后在编辑器内：

- `:PlugInstall` 安装插件，`:PlugClean` 清理已移除的插件
- coc 扩展首次启动时自动安装（需联网）

## 配置内容

### 基础配置

- 全局配置
    - `leader` 键设置为 `<Space>`（空格）
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
- 拼写检查
    - `en,cjk` + 驼峰拆词；默认关闭，`<leader>ts` 切换；markdown/gitcommit/text 自动开启
    - 词库在编辑器的 `spell/en.utf-8.add`（本机个人词库，已 `.gitignore`）

### autocmd自动操作

- 特定文件类型执行
    - 绑定快捷键使用系统默认软件打开当前文件
    - 针对python文件，设置快捷键按缩进折叠
- 光标恢复到上次操作文件位置
- 保存时去除行尾空白（markdown 除外）
- 高亮 TODO/FIXME/HACK/NOTE/XXX 标记

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

补全/LSP 核心 `coc.nvim`（双端共享）：补全、诊断、代码片段（`coc-snippets`）、`coc-git` 等；`Tab` 触发补全/展开片段。扩展含 basedpyright/go/clangd/sh/sql/json/yaml/toml/cmake、markdownlint、yank、floaterm 等。

双端共享的其他插件：

- `vim-commentary` 注释、`vim-easy-align` 对齐、`vim-surround`+`vim-repeat` 环绕
- `bullets` 自动列表、`vim-markdown`、`undotree`、`vim-fugitive` git、`indentLine` 缩进线
- `doom-one` 配色、`fcitx.nvim` 自动输入法切换

以下能力采用「vim 基线 / nvim 原生覆盖」，键位对齐：

- 模糊查找：vim `fzf` / nvim `telescope`
- 文件树：vim `nerdtree` / nvim `nvim-tree`
- 状态栏：vim `airline` / nvim `lualine`
- 快捷键提示：vim `vim-which-key` / nvim `which-key.nvim`
- 彩虹括号：vim `rainbow` / nvim `rainbow-delimiters`
- 颜色代码高亮：vim `vim-coloresque` / nvim `nvim-colorizer`
- 跳转 `s`/`S`：vim `vim-sneak` / nvim `flash`
- 多光标：vim `vim-visual-multi` / nvim `multicursor`
- 数字增减 `g=`/`g-`：vim `vim-speeddating` / nvim `dial`
- 面板跳转+缩放：vim `vim-tmux-navigator`（+`vim-kitty-navigator`）/ nvim `smart-splits`
- 浮动终端：vim `vim-floaterm` / nvim `toggleterm`
- 代码大纲：vim `vista` / nvim `aerial`
- org-mode：vim `jceb/vim-orgmode` / nvim `nvim-orgmode`
- 语法高亮强化：仅 nvim `nvim-treesitter`
- AI 辅助：`copilot`（双端，默认关，`<leader>tC` 切换）/ nvim `ChatGPT`（非 root）
