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
            },
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
        dependencies = "mfussenegger/nvim-dap",
        config = function()
            require("custom.configs.nvim-dap-ui")
        end,
    },
    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
    }
}
return plugins
