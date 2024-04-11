local M = {}

M.dap = {
    plugin = true,
    n = {
        ["<leader>db"] = {"<cmd>DapToggleBreakpoint <CR>", "Add breakpoint at line"},
        ["<leader>dr"] = {"<cmd>DapContinue <CR>", "Start or continue the debugger"},
        ["<leader>dg"] = {"<cmd> :lua os.execute(\"cd build && cmake -S ../ -B ./ -DCMAKE_BUILD_TYPE=debug -DCMAKE_EXPORT_COMPILE_COMMANDS=1\") <CR>", "Generates a compile_commands.json for ale supported tools"}
    }
}

M.dap_python = {
    plugin = true,
    n = {
        ["<leader>dpr"] = {
            function()
                require("dap-python").test_method()
            end
        }
    }
}
M.general = {
    n = {
        ["<C-h>"] = {"<cmd> TmuxNavigateLeft<CR>", "window left"},
        ["<C-l>"] = {"<cmd> TmuxNavigateRight<CR>", "window right"},
        ["<C-j>"] = {"<cmd> TmuxNavigateDown<CR>", "window down"},
        ["<C-k>"] = {"<cmd> TmuxNavigateUp<CR>", "window up"},
        ["<leader>gg"] = {"<cmd>LazyGit <CR>", "Lazygit"},
        ["<leader>tt"] =  {function () require("trouble").toggle() end, "Toggle LSP diagnostics"},
        ["<leader>tw"] =  {function () require("trouble").toggle("workspace_diagnostics") end, "LSP worksace diagnostics"},
        ["<leader>td"] =  {function () require("trouble").toggle("document_diagnostics") end, "LSP document diagnostics"},
        ["<leader>tq"] =  {function () require("trouble").toggle("quickfix") end, "LSP quickfix items"},
        ["<leader>tl"] =  {function () require("trouble").toggle("loclist") end, "LSP location list items"},
        ["<leader>gR"] =  {function () require("trouble").toggle("lsp_references") end, "LSP references of word under cursor"},
    },
}
return M
