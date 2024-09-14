require "nvchad.mappings"

-- add yours here

local set_keymap = vim.keymap.set

set_keymap("i", "jj", "<ESC>")

-- Improved map function with no naming conflict
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Mappings using the custom map function
map("n", "<space>r", ":RunCode<CR>")
map("n", "<space>ad", "ggVGd")
map("n", "<space>sa", "ggVG")
map("n", "<space>=", "ggVG=")
-- map("n", "<space>l", ":HopLine<CR>")
map("n", "<space>h", ":HopAnywhere<CR>")
map("n", "<space>u", ":UndotreeToggle<CR>")
map("n", "<space>o", ":AerialToggle<CR>")

-- Useful shortcuts
map("n", "<space>qq", ":wq<CR>")
map("n", "<space>qz", ":q!<CR>")

-- NERDTree mapping
map("n", "<space>i", ":NERDTreeToggleVCS<CR>")

-- Competitive programming keymaps
map("n", "<space>cc", ":CompetiTest receive contest<CR>")
map("n", "<space>cr", ":CompetiTest run<CR>")
map("n", "<space>aa", ":CompetiTest add_testcase<CR>")
map("n", "<space>dd", ":CompetiTest delete_testcase<CR>")
map("n", "<space>ee", ":CompetiTest edit_testcase<CR>")
map("n", "<space>ct", ":CompetiTest receive testcases<CR>")
map("n", "gt", "/cin >> t;<CR>_xxx<ESC>/void solve()<CR>j<ESC>")
map("n", "T", "/cin >> t;<CR>i// <ESC>/void solve()<CR>j<ESC>")
map("n", "gs", "/void solve()<CR>j<ESC>")
map("n", "<space>ll", "/#define int long long<CR>_xxx/void solve()<CR>j<ESC>")
map("n", "<space>lr", "/#define int long long<CR>_i// <ESC>/void solve()<CR>j<ESC>")
map("n", "<space>z", "ggV/upto<CR>zf/void solve()<CR>j<ESC>")
map("n", "<c-t>", ":NERDTreeToggleVCS<CR>")

-- Bufferline keymaps
map("n", "<Tab>", ":BufferLineCycleNext<CR>")
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>")
map("n", "X", ":BufferLineCloseOthers<CR>")

-- Move selected lines in visual mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "J", "%");

-- Insert mode mappings
map("i", "ww", "<C-w>")
map("i", "wd", "<ESC>ddO")

map("n", "U", "<C-u>zz")
map("n", "D", "<C-d>zz")
map("n", "[[", "[[zz")
map("n", "L", "$")
map("n", "H", "^")
map("n", "<space>mr",":PeekOpen<cr>")
map("n", "<space>hr", ":!cmd.exe /c start chrome http://127.0.0.1:8080<cr>")
map("n", "<space>ls", ":LiveServerStart<cr>")
map("n", "<space>lf", ":Lf<cr>")

-- Use tab to confirm selection and cycle through suggestions
map("i", "<Tab>", 'pumvisible() ? "\\<C-y>" : "\\<Tab>"', { expr = true })

-- Lua-specific mappings
set_keymap("n", "[d", vim.diagnostic.goto_prev, {})
set_keymap("n", "]d", vim.diagnostic.goto_next, {})

-- Set tab length and indentation settings
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true -- Use spaces instead of tabs

-- Miscellaneous settings
vim.cmd('TZMinimalist')
-- map('n', '-', ':lua vim.fn.execute("edit " .. vim.fn.expand("%:h"))<CR>')

vim.opt.termguicolors = true
require("bufferline").setup{}

-- Disable search highlighting
vim.o.hlsearch = false
map("n", "<space>y", "ggVGy")

-- Set relative line numbers
vim.api.nvim_command('set relativenumber')

vim.o.foldcolumn = '0' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true


vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
