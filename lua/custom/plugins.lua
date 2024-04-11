local plugins = {
      {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "pyright",
                "debugpy",
                "mypy",
                "ruff",
                "black",
                "rust-analyzer",
                "codelldb",
                "clangd",
                "clang-format",
                "texlab",
                "cmake-language-server",
                "cmakelang",
                "omnisharp",
                "lua-language-server",
                "stylua",
            },
        },
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
            dependencies = {
                "williamboman/mason.nvim",
                "mfussenegger/nvim-dap",
            },
            opts = {
                handlers = {},
                ensure_installed = {}
            },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("plugins.configs.lspconfig")
            require("custom.configs.lspconfig")
        end
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        event = "VeryLazy",
        ft = {"python"},
        opts = function ()
            return require("custom.configs.null-ls")
        end,
    },
    {
        "nmac427/guess-indent.nvim",
        config = function ()
            require('guess-indent').setup()
        end,
        lazy = false,
    },
    {
        "mfussenegger/nvim-dap",
        config = function(_, opts)
            require("core.utils").load_mappings("dap")
        end
    },
    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        },
        config = function(_, opts)
            local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
            require("dap-python").setup(path)
            require("core.utils").load_mappings("dap_python")
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        event = "VeryLazy",
        dependencies = "mfussenegger/nvim-dap",
        config = function()
            require("custom.configs.nvim-dap-ui")
        end,
    },
    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
    },
    {
        "kdheepak/lazygit.nvim",
        event = "VeryLazy",
        -- optional for floating window border
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    {
        "rust-lang/rust.vim",
        ft = "rust",
        init = function ()
            vim.g.rustfmt_autosave = 1
        end
    },
    {
        "folke/trouble.nvim",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        opts =function()
            require("custom.configs.trouble")
        end
    }
}
return plugins
