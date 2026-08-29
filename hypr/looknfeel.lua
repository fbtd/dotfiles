-- Change the default Omarchy look'n'feel.

-- https://wiki.hypr.land/Configuring/Basics/Variables/#general
hl.config({
  general = {
    -- No gaps between windows or borders.
    gaps_in = 0,
    gaps_out = 0,
    border_size = 4,

    layout = "master",
  },
})

-- https://wiki.hypr.land/Configuring/Basics/Variables/#decoration
hl.config({
  decoration = {
    -- Use round window corners.
    -- rounding = 8,

    -- Dim unfocused windows (0.0 = no dim, 1.0 = fully dimmed).
    dim_inactive = true,
    dim_strength = 0.03,
  },
})

-- https://wiki.hypr.land/Configuring/Basics/Variables/#animations
-- hl.config({
--   animations = {
--     -- Disable all animations.
--     enabled = false,
--   },
-- })

-- https://wiki.hypr.land/Configuring/Layouts/Master-Layout/
hl.config({
  master = {
    mfact = 2 / 3,
    new_status = "slave",
  },
})
-- https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/
hl.config({
  dwindle = {
    -- 1.0 is a 50/50 split. 4/3 gives the left/top window 2/3 of the space.
    -- force_split = 2 keeps the first window on the left with 2/3 when a
    -- second window opens. Split target is the focused window, not the cursor.
    default_split_ratio = 4 / 3,
    force_split = 2,
    preserve_split = true,
    smart_split = false,
    use_active_for_splits = true,
    smart_resizing = false,
    precise_mouse_move = false,
  },
})

-- https://wiki.hypr.land/Configuring/Basics/Variables/#layout
-- hl.config({
--   layout = {
--     -- Avoid overly wide single-window layouts on wide screens.
--     single_window_aspect_ratio = { 1, 1 },
--   },
-- })

-- https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/
-- hl.config({
--   scrolling = {
--     -- See only one column per screen instead of two.
--     column_width = 0.97,
--   },
-- })

hl.config({
  binds = {
    window_direction_monitor_fallback = false,
  },
})
