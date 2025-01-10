require "nvchad.mappings"

-- Shortcut for setting keymaps
local set_keymap = vim.keymap.set

-- Escape using 'jj' in insert mode
set_keymap("i", "jj", "<ESC>")

-- Improved map function with no naming conflict
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Statusline setting
vim.o.statusline = ' '

-- General mappings
map("n", "<space>r", ":RunCode<CR>") -- Run code

-- F9 key mapping for insert mode (g++ compile and run with additional flags)
vim.api.nvim_set_keymap('i', '<F9>', '<esc>:w<CR>:terminal g++ -fsanitize=address -std=c++20 -Wall -Wextra -Wshadow -DONPC -O2 -o %< % && ./%< <CR>i', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<F10>', ':w<CR>:terminal g++ -fsanitize=address -std=c++20 -Wall -Wextra -Wshadow -DONPC -O2 -o %< % && ./%< <CR>i', { noremap = true, silent = true })

map("n", "<space>ad", "ggVGd") -- Select and delete all content
map("n", "<space>sa", "ggVG") -- Select all content
map("n", "<space>=", "ggVG=") -- Format the entire file

-- Toggle utilities
map("n", "<space>h", ":HopAnywhere<CR>") -- Hop to any location
map("n", "<space>u", ":UndotreeToggle<CR>") -- Toggle Undo tree
map("n", "<space>o", ":AerialToggle<CR>") -- Toggle outline (Aerial)
map("n", "<space>a", ":NvimTreeToggle<CR>a")

-- File and buffer commands
map("n", "<space>qq", ":wq<CR>") -- Save and quit
map("n", "<space>qz", ":q!<CR>") -- Force quit

-- NERDTree mappings
map("n", "<space>i", ":NERDTreeToggleVCS<CR>") -- Toggle NERDTree with version control support

-- Competitive programming keymaps
map("n", "<space>cc", ":CompetiTest receive contest<CR>")
map("n", "<space>cr", ":CompetiTest run<CR>")
-- map("n", "<space>cc", ":CphReceive<cr>")
-- map("n", "<space>cr", ":CphTest<cr>")
map("n", "<space>aa", ":CompetiTest add_testcase<CR>")
map("n", "<space>dd", ":CompetiTest delete_testcase<CR>")
map("n", "<space>ee", ":CompetiTest edit_testcase<CR>")
map("n", "<space>ct", ":CompetiTest receive testcases<CR>")
map("n", "gt", "/cin >> t;<CR>_xxx<ESC>/void solve()<CR>j<ESC>zz") -- Go to test cases
map("n", "T", "/cin >> t;<CR>i// <ESC>/void solve()<CR>j<ESC>zz") -- Comment test cases
map("n", "gs", "/void solve()<CR>j<ESC>zz") -- Go to solve function
map("n", "<space>ll", "/#define int long long<CR>_xxx/void solve()<CR>j<ESC>zz")
map("n", "<space>lr", "/#define int long long<CR>_i// <ESC>/void solve()<CR>j<ESC>zz")
map("n", "<space>z", "ggV/upto<CR>zf/void solve()<CR>j<ESC>zz") -- Fold the solve function
map("n", "<space>cs", "/void solve()<CR>Vj%y")
map("n", "<space>ci", "/void solve()<CR>jvi{d%o")

-- Bufferline keymaps
map("n", "<Tab>", ":BufferLineCycleNext<CR>") -- Next buffer
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>") -- Previous buffer
map("n", "X", ":BufferLineCloseOthers<CR>") -- Close all other buffers

-- Move selected lines in visual mode
map("v", "J", ":m '>+1<CR>gv=gv") -- Move line down
map("v", "K", ":m '<-2<CR>gv=gv") -- Move line up

-- Jump to matching braces and parentheses
map("n", "J", "%")

-- Insert mode mappings
map("i", "ww", "<C-w>") -- Delete word in insert mode
map("i", "wd", "<ESC>ddO") -- Delete current line and create a new line

-- Navigation improvements
map("n", "U", "<C-u>") -- Scroll up half a page
map("n", "D", "<C-d>zz") -- Scroll down half a page and center cursor
map("n", "[[", "[[zz") -- Jump to previous section and center
map("n", "L", "$") -- Jump to end of line
map("n", "H", "^") -- Jump to beginning of line

-- Special commands
map("n", "<space>mr", ":PeekOpen<cr>") -- Open markdown preview
-- map("n", "<space>hr", ":!cmd.exe /c start chrome http://127.0.0.1:8080<cr>") -- Open local server in Chrome
-- map("n", "<space>hr", ":!cmd.exe /c start chrome %<CR>")
--
-- map("n", "<space>hr", ":!chrome.exe $(wslpath -w %)<CR>")
map("n", "<space>hr", ":!cmd.exe /c start chrome $(wslpath -w %)<CR>")
map("n", "<space>ls", ":LiveServerStart<cr>") -- Start live server
map("n", "<space>lf", ":Lf<cr>") -- Open file manager (lf)

-- Use Tab to confirm selection and cycle through suggestions in insert mode
map("i", "<Tab>", 'pumvisible() ? "\\<C-y>" : "\\<Tab>"', { expr = true })

-- Lua-specific diagnostic mappings
set_keymap("n", "[d", vim.diagnostic.goto_prev, {}) -- Go to previous diagnostic
set_keymap("n", "]d", vim.diagnostic.goto_next, {}) -- Go to next diagnostic

-- Set tab and indentation settings
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true -- Use spaces instead of tabs

-- Enable 24-bit RGB colors in the terminal UI
vim.opt.termguicolors = true
require("bufferline").setup{}

-- Disable search highlighting
vim.o.hlsearch = false
map("n", "<space>y", "ggVGy") -- Yank all content

-- Enable relative line numbers
vim.api.nvim_command('set relativenumber')

-- Folding settings
vim.o.foldcolumn = '0' -- Hide fold column
vim.o.foldlevel = 99 -- Set high fold level for ufo plugin
vim.o.foldlevelstart = 99 -- Start with all folds open
vim.o.foldenable = true -- Enable folding by default

-- Fold commands using ufo plugin
vim.keymap.set('n', 'zR', require('ufo').openAllFolds) -- Open all folds
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds) -- Close all folds

-- Set pitch-black background for floating windows (to match terminal look)
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#000000', fg = '#c8d3f5' }) -- Dark background with light text
--
-- -- Set border to a subtle gray to maintain a minimalist appearance
-- vim.api.nvim_set_hl(0, 'FloatBorder', { bg = '#000000', fg = '#444444' }) -- Gray border for minimal contrast
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = '#000000', fg = '#87ceeb' }) -- Gray border for minimal contrast
