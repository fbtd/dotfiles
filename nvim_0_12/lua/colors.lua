vim.opt.termguicolors = true

--------------
--everforest--
--------------
-- vim.cmd.colorscheme('everforest')
-- vim.g.everforest_background = 'hard'
-- vim.g.everforest_dim_inactive_windows = '0'
-- vim.g.everforest_sign_column_background = 'grey'
-- vim.g.everforest_ui_contrast = 'high'
-- vim.g.everforest_diagnostic_virtual_text = 'colored'
-- vim.g.everforest_enable_italic = false
-- vim.g.everforest_transparent_background = 1
-- vim.g.everforest_inlay_hints_background = 'dimmed'

--edge
-- vim.cmd.colorscheme('edge')
-- vim.g.edge_style = 'neon'
-- vim.g.edge_better_performance = 1

--material
-- vim.cmd.colorscheme('material')
-- vim.g.material_style = "oceanic"

--melange
-- vim.cmd.colorscheme('melange')

------------------
--rose pine dawn--
------------------
-- require("rose-pine").setup({
--     variant = "dawn", -- auto, main, moon, or dawn
--     dark_variant = "main", -- main, moon, or dawn
--     dim_inactive_windows = true,
--     extend_background_behind_borders = false,
--
--     enable = {
--         terminal = true,
--         legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
--         migrations = true, -- Handle deprecated options automatically
--     },
--
--     styles = {
--         bold = true,
--         italic = false,
--         transparency = false,
--     },
--
--     groups = {
--         border = "muted",
--         link = "iris",
--         panel = "surface",
--
--         error = "love",
--         hint = "iris",
--         info = "foam",
--         note = "pine",
--         todo = "rose",
--         warn = "gold",
--
--         git_add = "foam",
--         git_change = "rose",
--         git_delete = "love",
--         git_dirty = "rose",
--         git_ignore = "muted",
--         git_merge = "iris",
--         git_rename = "pine",
--         git_stage = "iris",
--         git_text = "rose",
--         git_untracked = "subtle",
--
--         h1 = "iris",
--         h2 = "foam",
--         h3 = "rose",
--         h4 = "gold",
--         h5 = "pine",
--         h6 = "foam",
--     },
--
--     palette = {
--         -- Override the builtin palette per variant
--         -- moon = {
--         --     base = '#18191a',
--         --     overlay = '#363738',
--         -- },
--     },
--
-- 	-- NOTE: Highlight groups are extended (merged) by default. Disable this
-- 	-- per group via `inherit = false`
--     highlight_groups = {
--         -- Comment = { fg = "foam" },
--         -- StatusLine = { fg = "love", bg = "love", blend = 15 },
--         -- VertSplit = { fg = "muted", bg = "muted" },
--         -- Visual = { fg = "base", bg = "text", inherit = false },
--     },
--
--     before_highlight = function(group, highlight, palette)
--         -- Disable all undercurls
--         -- if highlight.undercurl then
--         --     highlight.undercurl = false
--         -- end
--         --
--         -- Change palette colour
--         -- if highlight.fg == palette.pine then
--         --     highlight.fg = palette.foam
--         -- end
--     end,
-- })
-- vim.cmd.colorscheme('rose-pine-dawn')


------------
--nightfox--
------------
require('nightfox').setup({
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
    compile_file_suffix = "_compiled", -- Compiled file suffix
    transparent = false,     -- Disable setting background
    terminal_colors = false, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = true,     -- Non focused panes set to alternative background
    module_default = true,   -- Default enable value for modules
    colorblind = {
      enable = false,        -- Enable colorblind support
      simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
      severity = {
        protan = 0,          -- Severity [0,1] for protan (red)
        deutan = 0,          -- Severity [0,1] for deutan (green)
        tritan = 0,          -- Severity [0,1] for tritan (blue)
      },
    },
    styles = {               -- Style to be applied to different syntax groups
      comments = "NONE",     -- Value is any valid attr-list value `:help attr-list`
      conditionals = "NONE",
      constants = "NONE",
      functions = "NONE",
      keywords = "NONE",
      numbers = "NONE",
      operators = "NONE",
      strings = "NONE",
      types = "NONE",
      variables = "NONE",
    },
    inverse = {             -- Inverse highlight for different types
      match_paren = false,
      visual = false,
      search = false,
    },
    modules = {             -- List of various plugins and additional options
      -- ...
    },
  },
  palettes = {
-- https://github.com/EdenEast/nightfox.nvim/blob/ba47d4b4c5ec308718641ba7402c143836f35aa9/lua/nightfox/palette/dayfox.lua#L10
    dayfox = {
        bg0 = "#F5F5F5",
        bg1 = "#FFFFFF",
        bg3 = "#F4F4F4",
    }
  },
  specs = {},
  groups = {},
})

-- setup must be called before loading
vim.cmd("colorscheme dayfox")



-- vim.cmd("colorscheme xcodelight")

vim.opt.background = "light"

-- vim.api.nvim_set_hl(0, "CursorLine", {bg = "#dfdfdf"})
-- vim.api.nvim_set_hl(0, "MatchParen", {bg = "#a0a0a0"})
-- vim.api.nvim_set_hl(0, "Normal", {bg = "#ffffff"})
vim.g.vim_json_conceal = 0
