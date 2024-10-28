require("obsidian").setup({
    workspaces = {
        {
            name = "notes",
            path = "~/obsidian/notes/",
        },
    },
    mappings = {
        -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
        ["gf"] = {
            action = function()
                return require("obsidian").util.gf_passthrough()
            end,
            opts = { noremap = false, expr = true, buffer = true },
        },
        ["<cr>"] = {
            action = function()
                return require("obsidian").util.smart_action()
            end,
            opts = { buffer = true, expr = true },
        },
    },
    completion = {
        nvim_cmp = true,
        min_chars = 0,
    },
    note_id_func = function(title)
        local name = "untitled_note"
        if title ~= nil then
            -- If title is given, transform it into valid file name.
            name = title:gsub(" ", "_"):gsub("[^A-Za-z0-9-_]", ""):lower()
        else
            for _ = 1, 4 do
                name = name .. string.char(math.random(65, 90))
            end
        end
        return name
    end,
    disable_frontmatter = true,
    follow_url_func = function(url)
        -- Open the URL in the default web browser.
        vim.fn.jobstart({ "xdg-open", url }) -- linux
    end,
})

vim.keymap.set('n', 'ää', ':ObsidianOpen<CR>')
vim.keymap.set('n', 'än', ':ObsidianNew ')
vim.keymap.set('n', 'äf', ':ObsidianQuickSwitch<CR>')
vim.keymap.set('n', 'äs', ':ObsidianSearch<CR>')
vim.keymap.set('n', 'äo', ':ObsidianLinks<CR>')
vim.keymap.set('n', 'äi', ':ObsidianBacklinks<CR>')
vim.keymap.set('n', 'ät', ':ObsidianTOC<CR>')
vim.api.nvim_set_hl(0, "ObsidianHighlightText", {bg= "#eaf757"})
