---@type ChadrcConfig
local M = {}

M.ui = { theme = 'catppuccin' }
M.plugins = "custom.plugins"
require("custom.configs.vim_config")
M.mappings = require("custom.mappings")
-- requie("custom.configs.nvim_tree")
--require'nvim-treesitter.configs'.setup {
--  indent = {
--    enable = true
--  }
--}
return M
