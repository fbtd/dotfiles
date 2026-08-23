-- Learn how to configure Hyprland: https://wiki.hypr.land/Configuring/Start/

-- Omarchy's bootstrap keeps path setup out of this user config.
dofile((os.getenv("OMARCHY_PATH") or "/usr/share/omarchy") .. "/default/hypr/bootstrap.lua")

-- Disable all Omarchy default bindings. Add your own in hypr/bindings.lua.
-- omarchy_default_bindings = false
--
-- Or disable only bindings for Omarchy's preinstalled apps/web apps while
-- keeping core window-manager bindings:
-- omarchy_preinstalled_bindings = false

-- Load Omarchy defaults.
require("default.hypr.omarchy")

-- Put your personal overrides in these files. They're loaded after Omarchy's
-- defaults so package updates can improve the defaults without rewriting your
-- ~/.config/hypr files.
require("hypr.monitors")
require("hypr.input")
require("hypr.bindings")
require("hypr.looknfeel")
require("hypr.autostart")

-- Toggle config flags dynamically.
require("default.hypr.toggles")

-- Add any other personal Hyprland configuration below.
-- o.window("qemu", { workspace = "5" })

-- Pin workspaces to monitors. Ultrawide (DP-2 / Xiaomi) owns 1-9;
-- portrait Eizo (DP-1) owns 10 and is the default for that screen.
for workspace = 1, 9 do
  hl.workspace_rule({
    workspace = tostring(workspace),
    monitor = "DP-2",
    default = workspace == 1,
  })
end

hl.workspace_rule({
  workspace = "10",
  monitor = "DP-1",
  default = true,
  persistent = true,
})

-- Obsidian always opens on the portrait monitor's workspace.
o.window("md.obsidian.Obsidian", { workspace = "10", monitor = "DP-1" })
