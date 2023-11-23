" plugins 

call plug#begin()
" competitive programming plugins
Plug 'MunifTanjim/nui.nvim'        " it's a dependency
Plug 'xeluxee/competitest.nvim'

Plug 'phaazon/hop.nvim'
Plug 'ojroques/vim-oscyank', {'branch': 'main'}
Plug 'Pocco81/auto-save.nvim'
Plug 'https://github.com/is0n/jaq-nvim'
Plug 'https://github.com/xiyaowong/transparent.nvim'
Plug 'jiangmiao/auto-pairs' " for pairs [] 
Plug 'honza/vim-snippets' " snippets
Plug 'dcampos/nvim-snippy' "snippets
" Use release branch (recommended)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Or build from source code by using npm
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm ci'}
" colorschemes 
Plug 'ellisonleao/gruvbox.nvim'
call plug#end()


:set nu
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=v
:set ignorecase
:set showtabline=2
set background=dark " or light if you want light mode

"mappings
map <space>r :Jaq <cr>	"coderunner
map <space>y "+y<cr> 
map <space>hh <cmd>HopWord<cr>
map <space>ll <cmd>HopLine<cr>
map <space>hp <cmd>HopPattern<cr>

"competitive programming mappings
map <space>cr :CompetiTest run<cr>
map <space>aa :CompetiTest add_testcase<cr>
map <space>dd :CompetiTest delete_testcase<cr>


"remappings
imap fj <Esc>
imap ww <C-w>
imap jj <c-j>
nmap <Space>w :w<cr>
nmap <Space>z :wq<cr>
nmap <Space>q :q!<cr>



" yanking into system using osc25
"let g:oscyank_max_length = 0  " maximum length of a selection
"let g:oscyank_silent     = 0  " disable message on successful copy
"let g:oscyank_trim       = 0  " trim surrounding whitespaces before copy
let g:oscyank_osc52      = "\x1b]52;c;%s\x07"  " the OSC52 format string to use

autocmd TextYankPost *
			\ if v:event.operator is 'y' && v:event.regname is '+' |
			\ execute 'OSCYankRegister +' |
			\ endif


" splits 
set splitbelow splitright

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

noremap <silent> <c-left> :vertical resize +3<CR>
noremap <silent> <c-right> :vertical resize -3<CR>
noremap <silent> <c-Up> :resize +3<CR>
noremap <silent> <c-Down> :resize -3<CR>


" shifting the selected text up and down using J and K 
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"


lua <<EOF
require("gruvbox").setup({
    overrides = {
        SignColumn = {bg = "#ff9900"}
    }
})
vim.cmd("colorscheme gruvbox")
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
		cpp      = "g++ % -o $fileBase -std=c++20 && ./$fileBase",
		c		 = "gcc % -o $fileBase && ./$fileBase",
		java	 = "javac $fileBase.java && java $fileBase"

    }
  },

  behavior = {
    -- Default type
    default     = "float",

    -- Start in insert mode
    startinsert = true,

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
      height    = 0.7,
      width     = 0.7,
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

require("auto-save").setup {}
require('competitest').setup() -- to use default configuration
require'hop'.setup()
EOF
