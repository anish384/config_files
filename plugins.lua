local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options
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
        "neovim/nvim-lspconfig",
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.config.lspconfig"
        end,
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
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end, -- Override to setup mason-lspconfig
    },

    -- override plugin configs
    {
        "williamboman/mason.nvim",
        opts = overrides.mason
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = overrides.treesitter,
    },

    {
        "nvim-tree/nvim-tree.lua",
        opts = overrides.nvimtree,
    },

    -- Install a plugin
    {
        "max397574/better-escape.nvim",
        event = "InsertEnter",
        config = function()
            require("better_escape").setup()
        end,
    },

    {
        "stevearc/conform.nvim",
        --  for users those who want auto-save conform + lazyloading!
        -- event = "BufWritePre"
        config = function()
            require "custom.configs.conform"
        end,
        lazy = false,
    },

    -- To make a plugin not be loaded
    -- {
    --   "NvChad/nvim-colorizer.lua",
    --   enabled = false
    -- },

    -- All NvChad plugins are lazy-loaded by default
    -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
    -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
    -- {
    --   "mg979/vim-visual-multi",
    --   lazy = false,
    -- }
}

return plugins
