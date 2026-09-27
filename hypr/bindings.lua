-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Workspace switcher.
hl.unbind("SUPER + S") -- was: Toggle scratchpad
o.bind("SUPER + S", "Workspace switcher", "omarchy-menu-workspaces")

-- Layout. SUPER+I and SUPER+U had no default. SUPER+L is reused for the lock below.
hl.unbind("SUPER + I") -- nothing bound
o.bind("SUPER + I", "layout master", function()
  local ws = hl.get_active_workspace()
  if ws then
    hl.workspace_rule({ workspace = tostring(ws.id), layout = "master" })
  end
end)

hl.unbind("SUPER + U") -- nothing bound
o.bind("SUPER + U", "layout scrolling", function()
  local ws = hl.get_active_workspace()
  if ws then
    hl.workspace_rule({ workspace = tostring(ws.id), layout = "scrolling" })
  end
end)

-- Workspaces. Former workspace stays on SUPER+CTRL+TAB.
hl.unbind("SUPER + N")   -- nothing bound
o.bind("SUPER + N", "next workspace", hl.dsp.focus({ workspace = "+1" }))

hl.unbind("SUPER + P")   -- was: Pseudo window
o.bind("SUPER + P", "prev workspace", hl.dsp.focus({ workspace = "-1" }))

hl.unbind("SUPER + TAB") -- was: Next workspace
o.bind("SUPER + TAB", "former workspace", hl.dsp.focus({ workspace = "previous" }))

hl.unbind("SUPER + M")        -- nothing bound
o.bind("SUPER + M", "widen all columns 0.66", hl.dsp.layout("colresize 0.66"))

hl.unbind("SUPER + COMMA")    -- was: Dismiss last notification
o.bind("SUPER + COMMA", "widen all columns 0.495", hl.dsp.layout("colresize 0.495"))

hl.unbind("SUPER + PERIOD")   -- nothing bound
o.bind("SUPER + PERIOD", "widen all columns 0.33", hl.dsp.layout("colresize 0.33"))

hl.unbind("SUPER + MINUS")    -- nothing bound under this name
o.bind("SUPER + MINUS", "narrow all columns 0.15", hl.dsp.layout("colresize 0.245"))

hl.unbind("SUPER + SHIFT + M")       -- was: Music
o.bind("SUPER + SHIFT + M", "widen all columns 0.66", hl.dsp.layout("colresize all 0.66"))

hl.unbind("SUPER + SHIFT + COMMA")   -- was: Dismiss all notifications
o.bind("SUPER + SHIFT + COMMA", "widen all columns 0.48", hl.dsp.layout("colresize all 0.49"))

hl.unbind("SUPER + SHIFT + PERIOD")  -- nothing bound
o.bind("SUPER + SHIFT + PERIOD", "widen all columns 0.33", hl.dsp.layout("colresize all 0.33"))

hl.unbind("SUPER + SHIFT + MINUS")   -- nothing bound under this name
o.bind("SUPER + SHIFT + MINUS", "narrow all columns 0.15", hl.dsp.layout("colresize all 0.245"))

hl.unbind("SUPER + BACKSPACE")         -- was: Toggle window transparency
o.bind("SUPER + BACKSPACE", "consume or expel", hl.dsp.layout("consume_or_expel prev"))

hl.unbind("SUPER + SHIFT + BACKSPACE") -- was: Toggle window gaps
o.bind("SUPER + SHIFT + BACKSPACE", "consume or expel", hl.dsp.layout("consume_or_expel next"))

-- Screensaver and lock. SUPER+CTRL+L is still "Lock system".
hl.unbind("SUPER + SHIFT + S") -- was: Google Maps
o.bind("SUPER + SHIFT + S", "screensaver", "omarchy-launch-screensaver force")

hl.unbind("SUPER + L")         -- was: Toggle workspace layout
o.bind("SUPER + L", "screensaver", "omarchy system lock")

hl.unbind("SUPER + CTRL + S")  -- was: Share
o.bind("SUPER + CTRL + S", "screensaver", "omarchy system sleep lock && systemctl suspend")

-- webapps. Neither key had a default.
o.bind("SUPER + A", "dsh webapp - localhost:3080", { webapp = "http://127.0.0.1:3080" })
o.bind("SUPER + D", "learn - localhost:8000", { webapp = "http://127.0.0.1:8000" })

-- Disabled without a replacement.
-- Modifiers have to be joined with '+'. "SUPER ALT + RETURN" never matched.
hl.unbind("SUPER + ALT + RETURN")  -- was: Tmux
hl.unbind("SUPER + CTRL + RETURN") -- was: Herdr

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")
