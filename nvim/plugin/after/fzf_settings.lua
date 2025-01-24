local vim = vim
---------------
-- PREFIX: ü --
---------------
local actions = require "fzf-lua.actions"
require'fzf-lua'.setup {
    keymap = {
        builtin = {
            true,
            ü = "toggle-preview-cw",
        },
    },
    oldfiles = {
        include_current_session = true,  -- include bufs from current session
    },
    fzf_colors = {
        ["fg+"] = {"fg", "Exception"},
        -- ["bg+"] = {"bg", "Normal"},
    },
}

-- for old time sake
vim.keymap.set("n", "<c-P>", require('fzf-lua').files)

-- 'ü' will be our prefix
vim.keymap.set("n", "ür", require('fzf-lua').resume)
vim.keymap.set("n", "üü", require('fzf-lua').builtin)
vim.keymap.set("n", "üh", require('fzf-lua').helptags)
vim.keymap.set("n", "üf", require('fzf-lua').files)
vim.keymap.set("n", "üb", require('fzf-lua').buffers)
vim.keymap.set("n", "üi", function()
    local number = vim.opt.ft:get() ~= "man"
    require('fzf-lua').blines({
    ["winopts.preview.layout"] = "vertical",
    ["winopts.preview.vertical"] = "down:90%",
    ["winopts.preview.winopts.number"] = number,
    ["winopts.fullscreen"] = true})
end )
vim.keymap.set("n", "üc", require('fzf-lua').quickfix)
vim.keymap.set("n", "ül", require('fzf-lua').loclist)
vim.keymap.set("n", "üt", require('fzf-lua').tabs)
vim.keymap.set("n", "üm", require('fzf-lua').marks)
vim.keymap.set("n", "üj", require('fzf-lua').jumps)
vim.keymap.set("n", "ü\"", require('fzf-lua').registers)
vim.keymap.set("n", "üg", require('fzf-lua').live_grep)
vim.keymap.set("n", "ü:", require('fzf-lua').commands)

vim.keymap.set("i", "üf", require('fzf-lua').complete_path)


local YELLOW = "\27[33m"
local RESET = "\27[0m"
function Fzf_args_n()
    local opts = {
        prompt = "Args: ",
        actions = {
            ["default"] =  {
            type = "cmd",
            fn = function(selected)
                local path = selected[1]:match(".[0-9]*. (.*)")
                vim.cmd("edit " .. path)
            end,
        },
        },
        preview = {
            type = "cmd",
            fn = function(items)
                local path = items[1]:match(".[0-9]*. (.*)")
                return "cat " .. path
            end,
        }
    }

    local args = vim.fn.argv()
    local args_n = {}
    for i, arg in pairs(args) do
        local arg_n = "[" .. YELLOW .. i .. RESET .. "] " .. arg
        table.insert(args_n, arg_n)
    end

    require"fzf-lua".fzf_exec(args_n, opts)
end
vim.keymap.set('n', 'üa', Fzf_args_n, { noremap = true})
