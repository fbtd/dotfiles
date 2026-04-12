if not os.getenv('NO_TREESITTER') then
    ensure_installed = { "bash", "awk", "c", "c_sharp", "cmake", "comment", "cpp", "css",
        "csv", "diff", "dockerfile", "editorconfig", "erlang", "git_config", "git_rebase",
        "gitattributes", "gitcommit", "gitignore", "go", "goctl", "gpg", "graphql", "groovy",
        "html", "http", "java", "jq", "jsdoc", "json", "json5", "lua", "luap", "luau",
        "luadoc", "make", "markdown", "matlab", "mermaid", "nginx", "passwd",
        "pony", "php", "powershell", "puppet", "python", "r", "regex", "robots", "ruby",
        "rust", "scss", "sql", "ssh_config", "strace", "svelte", "tcl", "terraform", "tsv",
        "tmux", "toml", "typescript", "vim", "vimdoc", "vue", "wgsl", "yaml", "zig"
    }

    require 'nvim-treesitter'.install(ensure_installed)

    vim.api.nvim_create_autocmd('FileType', {
        pattern = ensure_installed,
        callback = function()
            -- syntax highlighting, provided by Neovim
            vim.treesitter.start()

            -- -- folds, provided by Neovim
            -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
            -- vim.wo.foldmethod = 'expr'
            --
            -- -- indentation, provided by nvim-treesitter
            -- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
    })

    require("nvim-treesitter-textobjects").setup {
        select = {
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            selection_modes = {
                ['@parameter.outer'] = 'v', -- charwise
                ['@function.outer'] = 'V',  -- linewise
                ['@class.outer'] = '<c-v>', -- blockwise
            },
        },
    }

    -- keymaps
    -- You can use the capture groups defined in `textobjects.scm`
    vim.keymap.set({ "x", "o" }, "ad", function()
        require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
    end)
    vim.keymap.set({ "x", "o" }, "id", function()
        require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
    end)

    vim.keymap.set({ "n", "x", "o" }, "-", function()
        require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
    end)

    vim.keymap.set({ "n", "x", "o" }, "_", function()
        require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
    end)

    vim.keymap.set({ "x", "o" }, "<space>", function()
        require("vim.treesitter._select").select_parent(vim.v.count1)
    end)

    vim.keymap.set({ "x", "o" }, "<backspace>", function()
        require("vim.treesitter._select").select_child(vim.v.count1)
    end)

    require 'treesitter-context'.setup {
        enable = true,
        multiwindow = false,
        max_lines = 3,            -- How many lines the window should span. Values <= 0 mean no limit.
        min_window_height = 11,   -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        line_numbers = true,
        multiline_threshold = 20, -- Maximum number of lines to show for a single context
        trim_scope = 'outer',     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        mode = 'cursor',          -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        separator = "_",
        zindex = 20,     -- The Z-index of the context window
        on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
    }

    vim.api.nvim_set_hl(0, "TreesitterContextSeparator", { link = "NormalFloat" })
end
