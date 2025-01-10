return {
    -- Lua
    -- Lazy
    {
        'kobbikobb/move-lines.nvim',
        config = function()
            require('move-lines').setup({
                move_down = 'J', -- Custom key for moving lines down
                move_up = 'K',   -- Custom key for moving lines up
                move_left = 'H', -- Custom key for moving lines left
                move_right = 'L' -- Custom key for moving lines right
            })
        end,
        lazy = false;
    },
    {
        "lervag/vimtex",
        lazy = false,     -- we don't want to lazy load VimTeX
        -- tag = "v2.15", -- uncomment to pin to a specific release
        init = function()
            -- VimTeX configuration goes here, e.g.
            vim.g.vimtex_view_method = "zathura"
        end
    },
    {
        "lmburns/lf.nvim",
        dependencies = { "akinsho/toggleterm.nvim" },
        config = function()
            -- This feature will not work if the plugin is lazy-loaded
            vim.g.lf_netrw = 1

            require("lf").setup({
                escape_quit = false,
                border = "rounded",
            })

            vim.keymap.set("n", "<M-o>", "<Cmd>Lf<CR>")

            vim.api.nvim_create_autocmd("User", {
                pattern = "LfTermEnter",
                callback = function(a)
                    vim.api.nvim_buf_set_keymap(a.buf, "t", "q", "q", { nowait = true })
                end,
            })
        end,
        lazy = false,  -- Ensure it's not lazy-loaded
    },
    {
        'kevinhwang91/nvim-ufo',
        dependencies ={ 'kevinhwang91/promise-async'},
        config = function ()
            require('ufo').setup({
                provider_selector = function(bufnr, filetype, buftype)
                    return {'treesitter', 'indent'}
                end
            })
        end,
    },
    {
        "ngtuonghy/live-server-nvim",
        event = "VeryLazy",
        build = ":LiveServerInstall",
        config = function()
            require("live-server-nvim").setup{}
        end,
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
    {
        "akinsho/bufferline.nvim",
        config = function()
            require("bufferline").setup{
                options = {
                    -- your bufferline options here
                    numbers = "both",
                    close_command = "bdelete! %d",
                    right_mouse_command = "bdelete! %d",
                    left_mouse_command = "buffer %d",
                    middle_mouse_command = nil,
                    indicator_icon = '▎',
                    buffer_close_icon = '',
                    modified_icon = '●',
                    close_icon = '',
                    left_trunc_marker = '',
                    right_trunc_marker = '',
                    max_name_length = 18,
                    max_prefix_length = 15,
                    tab_size = 18,
                    diagnostics = "nvim_lsp",
                    diagnostics_indicator = function(count, level, diagnostics_dict, context)
                        return "("..count..")"
                    end,
                    offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "center", padding = 1}},
                    show_buffer_icons = true,
                    show_buffer_close_icons = true,
                    show_close_icon = true,
                    show_tab_indicators = true,
                    persist_buffer_sort = true,
                    separator_style = "thin",
                    enforce_regular_tabs = false,
                    always_show_bufferline = false,
                    sort_by = 'id'
                }
            }
        end
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        -- stylua: ignore
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
        lazy = false,
    },
    {
        'https://github.com/preservim/nerdtree',
        lazy = false,
    },
    {
        "kawre/leetcode.nvim",
        build = ":TSUpdate html",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim", -- required by telescope
            "MunifTanjim/nui.nvim",

            -- optional
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            -- configuration goes here
        },
        lazy = false,
    },
    {
        "Pocco81/true-zen.nvim",
        config = function()
            require("true-zen").setup {
                -- your config goes here
                -- or just leave it empty :)
            }
        end,
        lazy= false,
    },
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        config = function()
            require "configs.conform"
        end,
    },
    {
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        -- setting the keybinding for LazyGit with 'keys' is recommended in
        -- order to load the plugin when the command is run for the first time
        keys = {
            { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
        }
    },
    {
        'echasnovski/mini.nvim',
        lazy = false,
    },
    {
        'https://github.com/mfussenegger/nvim-jdtls',
        lazy = false,
    },
    {
        'stevearc/aerial.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
        lazy = false,
    },
    {
        'stevearc/oil.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
        lazy = false,
    },
    {
        'https://github.com/p00f/cphelper.nvim',
        lazy = false,
    },
    {
        'nvim-lua/plenary.nvim',
        lazy = false,
    },
    {
        'https://github.com/mbbill/undotree',
        lazy = false,
    },
    {
        'https://github.com/xiyaowong/transparent.nvim',
        lazy = false,
    },
    {
        "karb94/neoscroll.nvim",
        config = function ()
            require('neoscroll').setup {}
        end,
        lazy = false,
    },
    {
        'Pocco81/auto-save.nvim',
        config = function()
            require("auto-save").setup {
                -- your config goes here
                -- or just leave it empty :)
            }
        end,
        lazy = false,
    },
    {
        'nvim-tree/nvim-web-devicons',
        lazy = false,
    },
    {
        'mg979/vim-visual-multi',
        lazy = false,
    },
    {
        'xeluxee/competitest.nvim',
        dependencies = 'MunifTanjim/nui.nvim',
        config = function() require('competitest').setup() end,
        lazy = false,
    },
    {
        "CRAG666/code_runner.nvim", config = true,
        lazy = false,
    },


    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require "configs.lspconfig"
        end,
    },

    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "jdtls","rust-analyzer","clangd","lua-language-server", "stylua",
                "html-lsp", "css-lsp" , "prettier"
            },
        },
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "vim", "lua", "vimdoc",
                "html", "css", "cpp", "c"
            },
        },
        lazy = false,
    },
}
