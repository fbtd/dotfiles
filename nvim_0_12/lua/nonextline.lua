-- no line jumping for w, W, e, E
local function more_words()
    return vim.fn.search("\\W\\w", "nW", vim.fn.line('.'))
end
for _, key in pairs {'w', 'W', 'e', 'E'} do
    vim.keymap.set('n', key, function()
        _=more_words() > 0 and vim.cmd("normal! " .. key) or vim.cmd("normal! $")
    end)
end
