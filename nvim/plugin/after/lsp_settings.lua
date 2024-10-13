local vim = vim
---------------
-- PREFIX: ä --
---------------
-- goodbye old localleader

--python's pyright
--require 'lspconfig'.pyright.setup{}

-- https://luals.github.io/#neovim-install
--require 'lspconfig'.lua_ls.setup{}

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'ää', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'äf', 'gqlh')
    vim.keymap.set('v', 'äf', 'gq')
    vim.keymap.set('n', 'äF', vim.lsp.buf.format, opts)
    vim.keymap.set('i', 'ä', '<c-x><c-o>')
    vim.keymap.set({ 'n', 'v' }, 'äa', vim.lsp.buf.code_action, opts)

    vim.keymap.set("n", "är", require('fzf-lua').lsp_references)
    vim.keymap.set("n", "äd", require('fzf-lua').lsp_definitions)
    vim.keymap.set("n", "äD", require('fzf-lua').lsp_declarations)
    vim.keymap.set("n", "äs", require('fzf-lua').lsp_document_symbols)
    vim.keymap.set("n", "äS", require('fzf-lua').lsp_workspace_symbols)
    vim.keymap.set("n", "äe", require('fzf-lua').lsp_document_diagnostics)
    vim.keymap.set("n", "äE", require('fzf-lua').lsp_workspace_diagnostics)
  end,
})

vim.opt.signcolumn='yes'
