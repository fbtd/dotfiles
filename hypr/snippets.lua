-- snippets
-- omarchy clipboard paste text uses wtype, and a physically held SUPER
-- merges into that virtual keyboard (same reason Super+V uses send_key_state
-- instead of wtype). Copy, then inject a real paste chord.
local function send_shortcut_once(mods, key)
  return function()
    hl.dispatch(hl.dsp.send_key_state({ mods = mods, key = key, state = "down" }))
    hl.timer(function()
      hl.dispatch(hl.dsp.send_key_state({ mods = mods, key = key, state = "up" }))
    end, { timeout = 50, type = "oneshot" })
  end
end

local function paste_snippet(text)
  return function()
    hl.exec_cmd("omarchy clipboard paste text --copy-only " .. o.shell_quote(text))
    local window = hl.get_active_window()
    local terminal = false
    if window then
      for _, tag in ipairs(window.tags or {}) do
        if tag:gsub("%*$", "") == "terminal" then
          terminal = true
          break
        end
      end
    end
    hl.timer(function()
      if terminal then
        send_shortcut_once("SHIFT", "Insert")()
      else
        send_shortcut_once("CTRL", "V")()
      end
    end, { timeout = 150, type = "oneshot" })
  end
end

o.bind("SUPER + F1", "snippet: email", paste_snippet("fabiano.taddei@gmail.com"))

local sauce = "cite the official documentation page that defines it — not a blog, Stack Overflow answer, or aggregator - and if you cannot name that page, say so instead of guessing."
o.bind("SUPER + F2", "snippet: sauce", paste_snippet("\nFor each function, module, symbol, or capability you mention, "  .. sauce))
o.bind("SUPER + F3", "snippet: sauce", paste_snippet(sauce))


