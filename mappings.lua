require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("i", "jj", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
vim.api.nvim_set_keymap("n", "<space>r", ":RunCode<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<space>ad", "ggVGd", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<space>sa", "ggVG", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<space>=", "ggVG=", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<space>l", ":HopLine<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<space>h", ":HopAnywhere<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<space>u", ":UndotreeToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<space>o", ":AerialToggle<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<space>z", ":TZMinimalist<cr>",{noremap = true, silent = true})

-- some useful sortcuts
vim.api.nvim_set_keymap("n", "<space>qq", ":wq<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<space>qz", ":q!<cr>", {noremap = true, silent = true})

-- nerdtree 
vim.api.nvim_set_keymap("n", "<space>i", ":NERDTreeToggleVCS<cr>", {noremap = true, silent = true})

-- my cp keymaps
vim.api.nvim_set_keymap("n", "<space>cc", ":CompetiTest receive contest<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<space>cr", ":CompetiTest run<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<space>aa", ":CompetiTest add_testcase<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<space>dd", ":CompetiTest delete_testcase<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<space>ee", ":CompetiTest edit_testcase<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<space>ct", ":CompetiTest receive testcases<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "gt", "/cin >> t;<cr>_xxx<esc>/void solve()<cr>j%O", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "T", "/cin >> t;<cr>i// <esc>/void solve()<cr>j%O", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "gs", "/void solve()<cr>j%O", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<space>ll", "/#define int long long<cr>_xxx/void solve()<cr>j%O", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<space>lr", "/#define int long long<cr>_i// <esc>/void solve()<cr>j%O", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<space>z", "ggV/upto<cr>zf/void solve()<cr>j%O",{noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<c-t>", ":NERDTreeToggleVCS<cr>",{noremap = true, silent = true})


-- bufferline keymaps
vim.api.nvim_set_keymap("n", "<Tab>", ":BufferLineCycleNext<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<S-Tab>", ":BufferLineCyclePrev<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "X", ":BufferLineCloseOthers<cr>", {noremap = true, silent = true})

-- vim.api.nvim_set_keymap("n", "<space>z", ":TZMinimalist<CR>",{noremap = true, silent = true})
-- Move selected lines in visual mode up
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
-- Move selected lines in visual mode down
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
-- Map ww to <C-w> in insert mode
vim.api.nvim_set_keymap("i", "ww", "<C-w>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "wd", "<esc>ddO", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "U", "<C-u>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "D", "<C-d>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "[[", "[[zz", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "L", "$", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "H", "^", { noremap = true, silent = true })

-- Use tab to confirm selection and cycle through suggestions
vim.api.nvim_set_keymap("i", "<Tab>", 'pumvisible() ? "\\<C-y>" : "\\<Tab>"', { expr = true })

-- Lua
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {})
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {})

-- Set tab length to 4 spaces
vim.o.tabstop = 4
-- Set width of tabs to 4 spaces
vim.o.softtabstop = 4
-- Set number of spaces tabs are replaced with
vim.o.shiftwidth = 4
-- Indentation settings
vim.o.expandtab = true -- Use spaces instead of tabs
-- Set relative line numbers

vim.cmd('TZMinimalist')

vim.api.nvim_set_keymap('n', '-', ':lua vim.fn.execute("edit " .. vim.fn.expand("%:h"))<CR>', {noremap = true, silent = true})

vim.opt.termguicolors = true
require("bufferline").setup{}
-- Disable search highlighting
vim.o.hlsearch = false
vim.api.nvim_set_keymap("n", "<space>y", "ggVGy", { noremap = true, silent = true })
