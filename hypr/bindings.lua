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

hl.unbind("SUPER ALT + RETURN")  --tmux
hl.unbind("SUPER CTRL + RETURN") --herdr
hl.unbind("SUPER + S")           --scratchpad
hl.unbind("SUPER + SHIFT + S")   --map
hl.unbind("SUPER + L")           --layout switch

o.bind("SUPER + I", "layout master", function()
  local ws = hl.get_active_workspace()
  if ws then
    hl.workspace_rule({ workspace = tostring(ws.id), layout = "master" })
  end
end)
hl.unbind("SUPER + U") --layout switch
o.bind("SUPER + U", "layout scrolling", function()
    local ws = hl.get_active_workspace()
  if ws then
    hl.workspace_rule({ workspace = tostring(ws.id), layout = "scrolling" })
  end
end)


hl.unbind("SUPER + N")
o.bind("SUPER + N", "next workspace", hl.dsp.focus({ workspace = "+1" }))

hl.unbind("SUPER + P")
o.bind("SUPER + P", "prev workspace", hl.dsp.focus({ workspace = "-1" }))

hl.unbind("SUPER + TAB")
o.bind("SUPER + TAB", "former workspace", hl.dsp.focus({ workspace = "previous" }))

hl.unbind("SUPER + PERIOD")
hl.unbind("SUPER + COMMA")
hl.unbind("SUPER + MINUS")
hl.unbind("SUPER + SHIFT + M")

o.bind("SUPER + M", "widen all columns 0.66", hl.dsp.layout("colresize 0.66"))
o.bind("SUPER + COMMA", "widen all columns 0.495", hl.dsp.layout("colresize 0.495"))
o.bind("SUPER + PERIOD", "widen all columns 0.33", hl.dsp.layout("colresize 0.33"))
o.bind("SUPER + MINUS", "narrow all columns 0.15", hl.dsp.layout("colresize 0.245"))

o.bind("SUPER + SHIFT + M", "widen all columns 0.66", hl.dsp.layout("colresize all 0.66"))
o.bind("SUPER + SHIFT + COMMA", "widen all columns 0.48", hl.dsp.layout("colresize all 0.49"))
o.bind("SUPER + SHIFT + PERIOD", "widen all columns 0.33", hl.dsp.layout("colresize all 0.33"))
o.bind("SUPER + SHIFT + MINUS", "narrow all columns 0.15", hl.dsp.layout("colresize all 0.245"))
o.bind("SUPER + BACKSPACE", "consume or expel", hl.dsp.layout("consume_or_expel prev"))

o.bind("SUPER + SHIFT + S", "screensaver", "omarchy-launch-screensaver force")
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
