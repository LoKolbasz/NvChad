local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities
local util = require("lspconfig/util")

local lspconfig = require("lspconfig")

lspconfig.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {"python"},
})

lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {"rust"},
    root_dir = util.root_pattern("Cargo.toml"),
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                allFeatures = true,
            }
        }
    }
})

lspconfig.clangd.setup({
    on_attach = function(client, bufnr)
        client.server_capabilities.signitureHelpProvider = false
        on_attach(client, bufnr)
    end,
    capabilities = capabilities,
    filetypes = {"cpp", "c", "cuda"},
})

lspconfig.texlab.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {"tex"},
})


lspconfig.cmake.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {"cmake"},
})

local os = require("os")
local omnisharp_server_loc = os.getenv("OMNISHARP_LANGUAGE_SERVER")
local pid = vim.fn.getpid()
lspconfig.omnisharp.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {"omnisharp", "--languageserver", "--hostPID", tostring(pid)},
    filetypes = {"cs"}
})
