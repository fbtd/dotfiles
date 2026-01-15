local vim = vim

vim.g.mapleader = "ö"

function P(a)
    print(vim.inspect(a))
end

require("plug")
local local_plugin_path = os.getenv('HOME') .. '/nvim_plugin_local.lua'
if vim.uv.fs_stat(local_plugin_path) then
   vim.cmd.source(local_plugin_path)
end

local local_init_path = os.getenv('HOME') .. '/nvim_init_local.lua'
if vim.uv.fs_stat(local_init_path) then
   vim.cmd.source(local_init_path)
end

require("general")

require("args")
require("autocomplete")
require("autocommands")
require("diffview-setup")
require("flash-setup")
require("fzf-setup")
require("lsp-setup")
require("nonextline")
require("oil-setup")
require("preview_window")
require("quickfix")
require("relative_numbers")
require("sessions")
require("mini-setup")
require("treesitter-setup")

require("colors")

vim.cmd.source(vim.fn.stdpath('config') .. '/statusline.vim')
