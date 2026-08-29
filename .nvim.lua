local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('lua_ls', {
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                -- paths used by `require`
                path = {
                    "lua/?.lua",
                    "lua/?/init.lua",
                }
            },
            workspace = {
                library =  {
                    os.getenv("VIMRUNTIME")
                }
            }
        }
    }
})

-- vim.lsp.config('bashls', {
--     capabilities = capabilities,
-- })

vim.lsp.enable{'lua_ls'}

local hypr = vim.api.nvim_create_augroup('local', { clear = false })
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = 'hypr/*.lua',
  group = hypr,
  callback = function()
    vim.opt.tabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.softtabstop = 2
  end
})
