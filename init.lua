return {
    -- Lua
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
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
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
        'smoka7/hop.nvim',
        version = "*",
        opts = {},
        lazy = false,
    },
    {
        'Pocco81/auto-save.nvim',
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
                "html", "css"
            },
        },
    },
}
