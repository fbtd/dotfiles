local formatter = vim.fn.stdpath('config') .. '/to_errorformat.awk'
local file_list = os.getenv('NVIM_FILE_LIST')
if file_list then
    local cmd = 'system("awk -f ' .. formatter .. ' --assign cwd=' .. vim.uv.cwd() .. ' ' .. file_list ..'")'
    vim.keymap.set('n', '<Leader>F', function () vim.cmd.cexpr(cmd) end)
    vim.keymap.set('n', '<Leader>G', function () vim.cmd.cgetexpr(cmd) end)
end
