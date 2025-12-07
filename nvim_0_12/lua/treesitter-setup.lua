if not os.getenv('NO_TREESITTER') then
    require 'nvim-treesitter.configs'.setup {
        -- A list of parser names, or "all" (the listed parsers MUST always be installed)
        ensured_installed = "all",
        -- ensure_installed = { "bash", "awk", "c", "c_sharp", "cmake", "comment", "cpp", "css",
        --     "csv", "diff", "dockerfile", "editorconfig", "erlang", "git_config", "git_rebase",
        --     "gitattributes", "gitcommit", "gitignore", "go", "goctl", "gpg", "graphql", "groovy",
        --     "html", "http", "java", "jq", "jsdoc", "json", "json5", "lua", "luap", "luau",
        --     "luadoc", "make", "markdown", "matlab", "mermaid", "nginx", "passwd",
        --     "pony", "php", "powershell", "puppet", "python", "r", "regex", "robots", "ruby",
        --     "rust", "scss", "sql", "ssh_config", "strace", "svelte", "tcl", "terraform", "tsv",
        --     "tmux", "toml", "typescript", "vim", "vimdoc", "vue", "wgsl", "yaml", "zig"
        -- },
        auto_install = true,

        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<space>v", -- set to `false` to disable one of the mappings
                node_incremental = "<S-space>",
                scope_incremental = "<space>",
                node_decremental = "<backspace>",
            },
        },
        textobjects = {
            move = {
                enable = true,
                lookahead = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    ["-"] = "@function.outer",
                },
                goto_previous_start = {
                    ["_"] = "@function.outer",
                },
            },
            select = {
                enable = true,

                -- Automatically jump forward to textobj, similar to targets.vim
                lookahead = true,

                keymaps = {
                    -- You can use the capture groups defined in textobjects.scm
                    ["ad"] = "@function.outer",
                    ["id"] = "@function.inner",
                },
                -- You can choose the select mode (default is charwise 'v')
                --
                -- Can also be a function which gets passed a table with the keys
                -- * query_string: eg '@function.inner'
                -- * method: eg 'v' or 'o'
                -- and should return the mode ('v', 'V', or '<c-v>') or a table
                -- mapping query_strings to modes.
                selection_modes = {
                    ['@parameter.outer'] = 'v', -- charwise
                    ['@function.outer'] = 'V',  -- linewise
                    ['@class.outer'] = '<c-v>', -- blockwise
                },
            },
        },
    }

    require 'treesitter-context'.setup {
        enable = true,
        multiwindow = false,
        max_lines = 0,      -- How many lines the window should span. Values <= 0 mean no limit.
        min_window_height = 11, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        line_numbers = true,
        multiline_threshold = 20, -- Maximum number of lines to show for a single context
        trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        mode = 'cursor',    -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        separator = "_",
        zindex = 20, -- The Z-index of the context window
        on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
    }



end
