" fj or jf is fixed for <esc> 
" space x - delete the word you are in and be in a insert mode 
" space w - write
" space z - write and quit
" space q - to quit without saving anything

map <space>rc :Jaq <cr>
nnoremap<space>v <C-v> " visual block remap 
nnoremap<space>e <cmd>Ex<cr>
nnoremap <space>c :
vnoremap <space>c :
noremap <Space>x *``cgn
nmap <Space>w :w<cr>
nmap <Space>z :wq<cr>
nmap <Space>q :q!<cr>
imap fj <esc>
imap jf <esc>
nnoremap <Tab> <cr>

set linebreak
set display+=lastline
set laststatus=2
:set number
:set showtabline=2
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4 
:set smarttab
:set softtabstop=4
:set mouse=a
:set background=dark" or light if you want light mode
colorscheme gruvbox
:set mousemoveevent 
:set nohlsearch
:set ignorecase " ignorecase when search
:set incsearch 
:set colorcolumn = "80"
:set ruler
let NERDTreeMinimalUI=1
set clipboard+=unnamedplus
call plug#begin()
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'https://github.com/folke/which-key.nvim'
Plug 'https://github.com/rebelot/kanagawa.nvim'
Plug 'karb94/neoscroll.nvim'
Plug 'https://github.com/is0n/jaq-nvim'
Plug 'https://github.com/CRAG666/code_runner.nvim'
Plug 'michaelb/sniprun', {'do': 'sh ./install.sh'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'tmsvg/pear-tree' " autocomplete ( { 
Plug 'ryanoasis/vim-devicons' " devicons 
Plug 'https://github.com/ellisonleao/gruvbox.nvim' " colorscheme
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-web-devicons' " Recommended (for coloured icons)
" Plug 'ryanoasis/vim-devicons' Icons without colours
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'phaazon/hop.nvim'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'MunifTanjim/nui.nvim'        " it's a dependency
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
" or                                , { 'branch': '0.1.x' }
Plug 'xeluxee/competitest.nvim'
Plug 'https://github.com/nvimdev/dashboard-nvim'
Plug 'EdenEast/nightfox.nvim' " Vim-Plug"
Plug 'glepnir/dashboard-nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'https://github.com/kdheepak/tabline.nvim'
Plug 'mattn/emmet-vim'
Plug 'turbio/bracey.vim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
call plug#end()
" telescope shortcuts

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Hop sortcuts 

nnoremap <space>hh <cmd>HopWord <cr>
set termguicolors
lua << EOF
require("bufferline").setup{}
EOF

inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap {<CR> {<CR>}<Esc>O
inoremap [ []<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

nmap <F8> :TagbarToggle<CR>
nmap <leader>u :UndotreeToggle<CR>


let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

set splitbelow splitright

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

noremap <silent> <c-left> :vertical resize +3<CR>
noremap <silent> <c-right> :vertical resize -3<CR>
noremap <silent> <c-Up> :resize +3<CR>
noremap <silent> <c-Down> :resize -3<CR>

map <Leader>th <C-w>t<c-w>H
map <Leader>tk <C-w>t<C-w>K

set fillchars+=vert:\

map <space>tt :10split term://bash<CR>

tnoremap <Esc> <c-\><c-n>


inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "\<Tab>"
if exists(':GuiFont')
	    GuiFont! Cousine Nerd Font Mono:h12
	endif

" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1
" airline setup
let g:airline_theme='deus'
lua << EOF
require("which-key").setup{} 
require('neoscroll').setup()
require'hop'.setup()
require('competitest').setup()
require('lualine').setup(
)
require('dashboard').setup(
{
    theme = 'hyper',
    config = {
      week_header = {
       enable = true,
      },
      shortcut = {
        { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
        {
          icon = ' ',
          icon_hl = '@variable',
          desc = 'Files',
          group = 'Label',
          action = 'Telescope find_files',
          key = 'f',
        },
        {
          desc = ' Apps',
          group = 'DiagnosticHint',
          action = 'Telescope app',
          key = 'a',
        },
        {
          desc = ' dotfiles',
          group = 'Number',
          action = 'Telescope dotfiles',
          key = 'd',
        },
      },
    },
  }
)
require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
	filetype_exclude = {"dashboard"}
}
-- vim.cmd("colorscheme kanagawa")
-- vim.cmd("colorscheme terafox")
-- require("catppuccin").setup({
--    flavour = "mocha", -- latte, frappe, macchiato, mocha
--     background = { -- :h background
--         light = "latte",
--         dark = "mocha",
--     },
--     transparent_background = false, -- disables setting the background color.
--     show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
--     term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
--     dim_inactive = {
--         enabled = false, -- dims the background color of inactive window
--         shade = "dark",
--         percentage = 0.15, -- percentage of the shade to apply to the inactive window
--     },
--     no_italic = false, -- Force no italic
--     no_bold = false, -- Force no bold
--     no_underline = false, -- Force no underline
--     styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
--         comments = { "italic" }, -- Change the style of comments
--         conditionals = { "italic" },
--         loops = {},
--         functions = {},
--         keywords = {},
--         strings = {},
--         variables = {},
--         numbers = {},
--         booleans = {},
--         properties = {},
--         types = {},
--         operators = {},
--     },
--     color_overrides = {},
--     custom_highlights = {},
--     integrations = {
--         cmp = true,
--         gitsigns = true,
--         nvimtree = true,
--         telescope = true,
--         notify = false,
--         mini = false,
--         -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
--     },
-- })
--
-- -- setup must be called before loading
-- vim.cmd.colorscheme "catppuccin"
require('jaq-nvim').setup{
  cmds = {
    -- Uses vim commands
    internal = {
      lua = "luafile %",
      vim = "source %"
    },

    -- Uses shell commands
    external = {
      markdown = "glow %",
      python   = "python3 %",
      go       = "go run %",
      sh       = "sh %",
	  cpp = "g++ % -o $fileBase -std=c++23 && ./$fileBase",
      c = "gcc % -o $fileBase && ./$fileBase",
	  java = "javac $fileBase.java && java $fileBase"
    }
  },

  behavior = {
    -- Default type
    default     = "float",

    -- Start in insert mode
    startinsert = false,

    -- Use `wincmd p` on startup
    wincmd      = false,

    -- Auto-save files
    autosave    = false
  },

  ui = {
    float = {
      -- See ':h nvim_open_win'
      border    = "none",

      -- See ':h winhl'
      winhl     = "Normal",
      borderhl  = "FloatBorder",

      -- See ':h winblend'
      winblend  = 0,

      -- Num from `0-1` for measurements
      height    = 0.8,
      width     = 0.8,
      x         = 0.5,
      y         = 0.5
    },

    terminal = {
      -- Window position
      position = "bot",

      -- Window size
      size     = 10,

      -- Disable line numbers
      line_no  = false
    },

    quickfix = {
      -- Window position
      position = "bot",

      -- Window size
      size     = 10
    }
  }
}
EOF

" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'jsformatter'

" bufferline configuration

lua require"bufferline".setup()

" bufferline shortcuts 
nnoremap <C-m> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <Space>y <leader>+y " this is for copying from here and pasting somewhere else

nmap <f5> :w <Bar> !open %<CR>

" SnipRun shortcuts 
nmap <Space>r <Plug>SnipRun
nmap <Space>f <Plug>SnipRunOperator
vmap r <Plug>SnipRun
