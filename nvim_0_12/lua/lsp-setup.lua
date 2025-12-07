vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', '<space><space>', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<space>f', 'gqlh')
        vim.keymap.set('v', '<space>f', 'gq')
        vim.keymap.set('n', '<space>F', vim.lsp.buf.format, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>a', vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<space>r", require('fzf-lua').lsp_references)
        vim.keymap.set("n", "<space>d", require('fzf-lua').lsp_definitions)
        vim.keymap.set("n", "<space>D", require('fzf-lua').lsp_declarations)
        vim.keymap.set("n", "<space>i", require('fzf-lua').lsp_incoming_calls)
        vim.keymap.set("n", "üs", require('fzf-lua').lsp_document_symbols)
        vim.keymap.set("n", "üS", require('fzf-lua').lsp_workspace_symbols)
        vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
        vim.keymap.set("n", "<space>E", function() vim.diagnostic.open_float({ scope = 'b' }) end)
        vim.keymap.set("n", "üe", require('fzf-lua').lsp_document_diagnostics)
        vim.keymap.set("n", "üE", require('fzf-lua').lsp_workspace_diagnostics)

        vim.keymap.set("n", "<space>h", vim.lsp.buf.document_highlight)
        vim.keymap.set("n", "<space>c", vim.lsp.buf.clear_references)

        vim.keymap.set("i", "<C-h>", function()
            require('cmp').close()
            vim.lsp.buf.signature_help()
        end)

        -- restore statusline
        vim.cmd.source(vim.fn.stdpath('config') .. '/statusline.vim')
    end
})


-- bash defaults
local capabilities = require('cmp_nvim_lsp').default_capabilities()
vim.lsp.config('bashls', {
    capabilities = capabilities,
})

vim.lsp.enable { 'bashls' }
