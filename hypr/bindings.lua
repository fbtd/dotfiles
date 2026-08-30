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

hl.unbind("SUPER ALT + RETURN") --tmux
hl.unbind("SUPER CTRL + RETURN") --herdr
hl.unbind("SUPER + S") --scratchpad
hl.unbind("SUPER + L") --layout switch

hl.unbind("SUPER + N")
o.bind("SUPER + N", "next workspace", hl.dsp.focus({workspace = "+1"}))

hl.unbind("SUPER + P")
o.bind("SUPER + P", "prev workspace", hl.dsp.focus({workspace = "-1"}))

hl.unbind("SUPER + TAB")
o.bind("SUPER + TAB", "former workspace", hl.dsp.focus({workspace = "previous"}))

o.bind("SUPER + M", "swap with master", hl.dsp.layout("swapwithmaster"))

-- o.bind("SUPER + L", "screensaver", "omarchy-launch-screensaver force")
o.bind("SUPER + L", "screensaver", "omarchy system lock")

-- webapps
o.bind("SUPER + A", "dsh webapp - localhost:3080", { webapp = "http://127.0.0.1:3080" })
o.bind("SUPER + D", "learn - localhost:8000", { webapp = "http://127.0.0.1:8000" })

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")

-- Workspace switcher popup (number + name), same UI as omarchy-menu-select.
o.bind("SUPER + S", "Workspace switcher", "omarchy-menu-workspaces")
