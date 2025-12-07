local EchoArgs = {}

function EchoArgs.echo()
    local msg             = {}
    local bufnr_this_file = vim.fn.bufnr("%")
    local bufnr_alt_file  = vim.fn.bufnr("#")
    for i, arg in ipairs(vim.fn.argv()) do
        local bufnr = vim.fn.bufnr(arg)
        local m = {}
        local plus = ""
        if vim.bo[bufnr].modified then
            plus = " [+]"
        end
        table.insert(m , tostring(i) .. ": " .. arg .. plus)
        if bufnr == bufnr_this_file then
            table.insert(m, "Substitute")
        elseif bufnr == bufnr_alt_file then
            table.insert(m, "Visual")
        else
            table.insert(m, "Normal")
        end
        table.insert(msg, m)
        if i < vim.fn.argc() then
            table.insert(msg, { " | ", "Comment" })
        end
    end
    vim.api.nvim_echo(msg, false, {})
end

return EchoArgs

