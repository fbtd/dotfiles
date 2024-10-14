local vim = vim
---------------
-- PREFIX: ä --
---------------
-- goodbye old localleader

-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled. (pyright, lua_ls,...)
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--     capabilities = capabilities
-- }



vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', '<space><space>', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<space>f', 'gqlh')
        vim.keymap.set('v', '<space>f', 'gq')
        vim.keymap.set('n', '<space>F', vim.lsp.buf.format, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>a', vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<space>r", require('fzf-lua').lsp_references)
        vim.keymap.set("n", "<space>d", require('fzf-lua').lsp_definitions)
        vim.keymap.set("n", "<space>D", require('fzf-lua').lsp_declarations)
        vim.keymap.set("n", "<space>s", require('fzf-lua').lsp_document_symbols)
        vim.keymap.set("n", "<space>S", require('fzf-lua').lsp_workspace_symbols)
        vim.keymap.set("n", "<space>e", require('fzf-lua').lsp_document_diagnostics)
        vim.keymap.set("n", "<space>E", require('fzf-lua').lsp_workspace_diagnostics)

        vim.keymap.set("i", "<C-h>", function()
            require('cmp').close()
            vim.lsp.buf.signature_help()
        end)
    end,
})

vim.opt.signcolumn = 'yes'
