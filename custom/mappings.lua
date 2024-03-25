---@type MappingsTable
local M = {}

M.general = {
  n = {

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    }

  },
  v = {
    [">"] = { ">gv", "indent"},
  },
}

-- more keybinds!
vim.api.nvim_set_keymap('n', '<space>r', ':RunCode<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>cr', ':CompetiTest run<CR>', {noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>aa', ':CompetiTest add_testcase<CR>', {noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>dd', ':CompetiTest delete_testcase<CR>', {noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>ee', ':CompetiTest edit_testcase<CR>', {noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>ad', 'ggVGd', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>sa', 'ggVG', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>l', ':HopLine<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>h', ':HopAnywhere<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>u', ':UndotreeShow<CR>', {noremap = true, silent = true })
-- Move selected lines in visual mode up
vim.api.nvim_set_keymap('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
-- Move selected lines in visual mode down
vim.api.nvim_set_keymap('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
-- Map ww to <C-w> in insert mode
vim.api.nvim_set_keymap('i', 'ww', '<C-w>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'q', ':wq<cr>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'U', '<C-u>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'D', '<C-d>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[[', '[[zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'L', '$', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'H', '^', { noremap = true, silent = true })
-- Use tab to confirm selection and cycle through suggestions
vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "\\<C-y>" : "\\<Tab>"', {expr = true})
-- Lua
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { })
return M
