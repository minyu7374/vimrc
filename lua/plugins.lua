-- lazy.nvim 插件规范
-- 从 plug_load.vim 迁移

return {
  -- WhichKey (on-demand lazy load)
  { 'liuchengxu/vim-which-key', cmd = { 'WhichKey', 'WhichKey!' } },

  -- coc.nvim
  { 'neoclide/coc.nvim', branch = 'release', build = 'yarn install --frozen-lockfile' },

  -- snippets
  'honza/vim-snippets',

  -- 注释
  'scrooloose/nerdcommenter',

  -- 对齐
  'godlygeek/tabular',

  -- bullets
  'dkarter/bullets.vim',

  -- markdown
  { 'plasticboy/vim-markdown', ft = 'markdown' },

  -- toml
  { 'cespare/vim-toml', branch = 'main', ft = 'toml' },

  -- json
  { 'elzr/vim-json', ft = 'json' },

  -- python
  { 'lambdalisue/vim-pyenv', ft = 'python' },

  -- 日期处理
  'tpope/vim-speeddating',

  -- orgmode
  'jceb/vim-orgmode',

  -- visual-multi
  { 'mg979/vim-visual-multi', branch = 'master' },

  -- vista (tagbar 替代)
  'liuchengxu/vista.vim',

  -- undotree
  'mbbill/undotree',

  -- easymotion
  'easymotion/vim-easymotion',

  -- git
  'tpope/vim-fugitive',

  -- indentLine
  'Yggdroot/indentLine',

  -- colorscheme
  'romgrk/doom-one.vim',

  -- airline
  'vim-airline/vim-airline',
  'vim-airline/vim-airline-themes',

  -- rainbow
  'luochen1990/rainbow',

  -- color
  'gorodinskiy/vim-coloresque',

  -- fcitx (nvim)
  'h-hg/fcitx.nvim',

  -- tmux navigator
  'christoomey/vim-tmux-navigator',

  -- kitty navigator
  { 'knubie/vim-kitty-navigator', build = 'cp ./*.py ~/.config/kitty/' },

  -- floaterm
  'voldikss/vim-floaterm',

  -- ========== nvim-only 插件 ==========
  -- 依赖
  'nvim-lua/plenary.nvim',
  'MunifTanjim/nui.nvim',

  -- render-markdown
  'MeanderingProgrammer/render-markdown.nvim',

  -- 可选依赖 (avante.nvim)
  'hrsh7th/nvim-cmp',
  'nvim-tree/nvim-web-devicons',
  'HakonHarnes/img-clip.nvim',
  -- 'zbirenbaum/copilot.lua',
  'stevearc/dressing.nvim',
  'folke/snacks.nvim',

  -- avante.nvim (非 root 用户)
  {
    'yetone/avante.nvim',
    branch = 'main',
    build = 'make',
    cond = os.getenv('USER') ~= 'root',
  },

  -- nvim-tree
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = 'nvim-tree/nvim-web-devicons',
  },

  -- notify
  'rcarriga/nvim-notify',

  -- treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },

  -- telescope
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
  },

  -- telescope-coc
  'fannheyward/telescope-coc.nvim',
}
