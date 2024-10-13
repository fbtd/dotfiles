require 'lspconfig'.lua_ls.setup {
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
