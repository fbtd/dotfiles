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
