local capabilities = require('cmp_nvim_lsp').default_capabilities()

require 'lspconfig'.lua_ls.setup {
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
}
