call plug#begin()
" competitive programming plugins
Plug 'rebelot/kanagawa.nvim'
Plug 'mbbill/undotree'
Plug 'ofirgall/ofirkai.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'MunifTanjim/nui.nvim'        " it's a dependency
Plug 'xeluxee/competitest.nvim'
Plug 'folke/tokyonight.nvim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'} " multiline editing
Plug 'https://github.com/Zeioth/compiler.nvim'
Plug 'https://github.com/honza/vim-snippets'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'phaazon/hop.nvim'
Plug 'ojroques/vim-oscyank', {'branch': 'main'}
Plug 'Pocco81/auto-save.nvim'
Plug 'https://github.com/xiyaowong/transparent.nvim'
Plug 'jiangmiao/auto-pairs' " for pairs [] 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm ci'}
" Use release branch (recommended)
" Or build from source code by using npm
" colorschemes 
Plug 'ellisonleao/gruvbox.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'https://github.com/CRAG666/code_runner.nvim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
Plug 'https://github.com/neovim/nvim-lspconfig'
Plug 'craftzdog/solarized-osaka.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'https://github.com/p00f/cphelper.nvim'
call plug#end()
:colorscheme ofirkai
:colorscheme ofirkai
set nu
set termguicolors
:set termguicolors
:set relativenumber
:set mousemoveevent
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set nohlsearch
:set smarttab
:set softtabstop=4
:set mouse=a
:set ignorecase
:set showtabline=2
set background=dark " or light if you want light mode

highlight Comment cterm=italic

"mappings
map <space>r :RunCode<cr>	
map <space>y "+y<cr> 
map <space>h <cmd>HopWord<cr>
map <space>l <cmd>HopLine<cr>
map <space>p <cmd>HopPattern<cr>

"competitive programming mappings
map <space>cr :CompetiTest run<cr>
" map <space>cr :CphTest<cr>
map <space>aa :CompetiTest add_testcase<cr>
map <space>dd :CompetiTest delete_testcase<cr>

nnoremap <cr> :bNext<CR>
nnoremap <space>e :Ex<CR>

" Map Ctrl + Shift + Tab to cycle backward through buffers
nnoremap <C-S-Tab> :BufferLineCyclePrev<CR>


let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='minimalist'
let g:airline_left_sep = "\uE0B4"
let g:airline_right_sep = "\uE0B6"
let g:airline_skip_empty_sections = 1
" Disable trailing whitespace indicator in Airline
" Display only necessary statusline components
let g:airline_section_a = '%{fnamemodify(expand("%:p"), ":t")}'
let g:airline_section_b = ''
let g:airline_section_c = '%{strftime("%H:%M")}'
let g:airline_section_x = ''
let g:airline#extensions#whitespace#enabled = 0

" Disable mixed-indentation file warning
let g:airline#extensions#whitespace#mixed_indent_always = 0

let g:airline_section_y = ''  " Disable the percentage indicator
let g:airline_section_z = ''  " Disable the line number display

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
require("ibl").setup()
require("gruvbox").setup({
    overrides = {
        ["@lsp.type.method"] = { bg = "#ff9900" },
        ["@comment.lua"] = { bg = "#000000" },
    }
})
-- vim.cmd("colorscheme gruvbox")
require("auto-save").setup {}
require('competitest').setup() -- to use default configuration
require'hop'.setup()
require('Comment').setup()
require('code_runner').setup({})
require("tokyonight").setup({})
-- vim.cmd[[colorscheme tokyonight-storm]]
require('kanagawa').setup({})
--vim.cmd("colorscheme kanagawa")
-- require("bufferline").setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.clangd.setup{}
-- vim.cmd[[colorscheme solarized-osaka]]
require'lspconfig'.rust_analyzer.setup{}
EOF

nnoremap <space>u :UndotreeToggle<CR>

