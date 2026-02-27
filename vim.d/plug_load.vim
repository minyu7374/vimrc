"""----- 插件 -----"""
" vim: curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" nvim: sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
call plug#begin()
    Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] } "On-demand lazy load
    " Plug 'liuchengxu/vim-which-key'

    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'honza/vim-snippets'
    " Plug 'w0rp/ale'
    
    " Plug 'fatih/vim-go', { 'for': 'go' , 'do': ':GoInstallBinaries' }
    Plug 'scrooloose/nerdcommenter'         " 注释
    Plug 'godlygeek/tabular'                " 文本对齐
    Plug 'dkarter/bullets.vim'              " 用于增强 Markdown 和其他文档格式中的项目符号列表支持。
    Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
    Plug 'cespare/vim-toml', {'branch': 'main', 'for': 'toml', }
    Plug 'elzr/vim-json', { 'for' : 'json' }
    Plug 'lambdalisue/vim-pyenv', {'for': 'python'}
    Plug 'tpope/vim-speeddating'            " 可以用 ctrl+a/x 处理日期
    Plug 'jceb/vim-orgmode'
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}

    Plug 'liuchengxu/vista.vim'             "替代 preservim/tagbar
    Plug 'mbbill/undotree'
    Plug 'easymotion/vim-easymotion'
    Plug 'tpope/vim-fugitive'
    Plug 'Yggdroot/indentLine'
    " Plug 'lukas-reineke/indent-blankline.nvim' " nvim中的，json大文件卡顿，不如统一使用indentLine

    " Plug 'EdenEast/nightfox.nvim', { 'branch': 'main' }
    " Plug 'joshdick/onedark.vim'
    Plug 'romgrk/doom-one.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'luochen1990/rainbow'              " 提供括号、方括号和花括号的彩虹高亮，方便括号配对查看
    Plug 'gorodinskiy/vim-coloresque'       " 提供颜色代码的可视化高亮（css等文件）
    " Plug 'lilydjwg/colorizer'               " 不限制文件语言(大文件卡顿)

    Plug 'h-hg/fcitx.nvim'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'knubie/vim-kitty-navigator', {'do': 'cp ./*.py ~/.config/kitty/'}
    Plug 'voldikss/vim-floaterm'            " 浮动窗口

    if has('nvim')
        if $USER != 'root'
            Plug 'MunifTanjim/nui.nvim'
            Plug 'jackMort/ChatGPT.nvim'
        endif

        Plug 'nvim-tree/nvim-web-devicons'     " optional(file icons)
        Plug 'nvim-tree/nvim-tree.lua'

        Plug 'rcarriga/nvim-notify'
        Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

        " telescope and its dependencies
        Plug 'nvim-lua/plenary.nvim'
        Plug 'BurntSushi/ripgrep'
        Plug 'sharkdp/fd'
        Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
        Plug 'nvim-telescope/telescope.nvim'
        Plug 'fannheyward/telescope-coc.nvim'
    else
        " Plug 'sheerun/vim-polyglot'             "改进各种语言的语法突出显示(大文件性能差)
        Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

        Plug 'junegunn/fzf.vim'
        Plug 'antoinemadec/coc-fzf'
    endif

call plug#end()
