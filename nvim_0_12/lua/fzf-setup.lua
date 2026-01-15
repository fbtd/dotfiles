local vim = vim
---------------
-- PREFIX: ü --
---------------
local actions = require "fzf-lua.actions"
local builtin = require("fzf-lua.previewer.builtin")


require 'fzf-lua'.setup {
    keymap = {
        builtin = {
            true,
            ü = "toggle-preview-cw",
        },
    },
    files = {
        actions = {
            -- not sure why cant i just call split...
            ["ctrl-h"] = function(selected, opts)
                actions.file_split(selected, opts)
                actions.dummy_abort(selected, opts)
            end,
            ["ctrl-A"] = function(selected, opts)
                vim.cmd("%argdelete")
                actions.arg_add(selected, opts)
            end,
        },
    },
    oldfiles = {
        true,
        include_current_session = true, -- include bufs from current session
    },
    fzf_colors = {
        true,
        -- ["fg+"] = { "fg", "Exception" },
        -- ["bg+"] = {"bg", "Normal"},
    },
    grep = {
        rg_opts            = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -e",
        toggle_hidden_flag = "--hidden",
        actions            = {
            ["ctrl-h"] = { actions.toggle_hidden },
        }
    },
}

-- for old time sake
vim.keymap.set("n", "<c-P>", require('fzf-lua').files)

-- 'ü' will be our prefix
vim.keymap.set('n', 'üa', require('fzf-lua').args)
vim.keymap.set("n", "ür", require('fzf-lua').resume)
vim.keymap.set("n", "üü", require('fzf-lua').builtin)
vim.keymap.set("n", "üo", require('fzf-lua').oldfiles)
vim.keymap.set("n", "üh", require('fzf-lua').helptags)
vim.keymap.set("n", "üf", require('fzf-lua').files)
vim.keymap.set("n", "üb", require('fzf-lua').buffers)
vim.keymap.set("n", "üi", function()
    local number = vim.opt.ft:get() ~= "man"
    require('fzf-lua').blines({
        ["winopts.preview.layout"] = "vertical",
        ["winopts.preview.vertical"] = "down:90%",
        ["winopts.preview.winopts.number"] = number,
        ["winopts.fullscreen"] = true
    })
end)
vim.keymap.set("n", "üt", require('fzf-lua').tabs)
vim.keymap.set("n", "üc", require('fzf-lua').quickfix)
vim.keymap.set("n", "ül", require('fzf-lua').loclist)
vim.keymap.set("n", "üT", require('fzf-lua').lsp_typedefs)
vim.keymap.set("n", "üm", require('fzf-lua').marks)
vim.keymap.set("n", "üj", require('fzf-lua').jumps)
vim.keymap.set("n", "ü\"", require('fzf-lua').registers)
vim.keymap.set("n", "üg", require('fzf-lua').live_grep)
vim.keymap.set("n", "ü:", require('fzf-lua').commands)

vim.keymap.set("i", "üf", require('fzf-lua').complete_path)

local MarkPreviewer = builtin.buffer_or_file:extend()

function MarkPreviewer:new(o, opts, fzf_win)
    MarkPreviewer.super.new(self, o, opts, fzf_win)
    setmetatable(self, MarkPreviewer)
    return self
end

function MarkPreviewer:parse_entry(entry_str)
    local _, path, line = entry_str:match("(.)%s+([^:]+):?(.*)")
    return {
        path = vim.fn.expand(path),
        line = tonumber(line) or 1,
        col = 1,
    }
end

local YELLOW = "\27[33m"
local RESET = "\27[0m"
function Fzf_args_n()
    local opts = {
        prompt = "Args: ",
        actions = {
            ["tab"] = actions.dummy_abort,
            ["default"] = {
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
                return "head -n200 " .. path
            end,
        }
    }

    local args = vim.fn.argv()
    local args_n = {}
    for i, arg in pairs(args) do
        local arg_n = "[" .. YELLOW .. i .. RESET .. "] " .. arg
        table.insert(args_n, arg_n)
    end

    require "fzf-lua".fzf_exec(args_n, opts)
end

vim.keymap.set('n', 'üö', Fzf_args_n, { noremap = true })

function Fzf_upper_marks()
    local opts = {
        prompt = "MARKS: ",
        actions = {
            ["tab"] = actions.dummy_abort,
            ["default"] = {
                type = "cmd",
                fn = function(selected)
                    local mark = selected[1]:sub(1, 1)
                    vim.cmd("normal `" .. mark)
                end,
            },
        },
        previewer = MarkPreviewer,
    }

    local marks = vim.fn.getmarklist()

    local marks_n = {}
    for _, mark in pairs(marks) do
        if tonumber(mark["mark"]:sub(2)) == nil then
            local mark_n = YELLOW .. mark["mark"]:sub(2) .. RESET .. "  " .. mark["file"] ..
                YELLOW .. ":" .. RESET .. tostring(mark["pos"][2])
            table.insert(marks_n, mark_n)
        end
    end

    require "fzf-lua".fzf_exec(marks_n, opts)
end

vim.keymap.set('n', '<tab>', Fzf_upper_marks, { noremap = true })

require "fzf-lua".register_ui_select()
