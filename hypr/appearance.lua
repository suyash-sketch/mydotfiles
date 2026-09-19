local theme = dofile(os.getenv("HOME") .. "/.config/omakase/current/theme/hyprland.lua")

-- hl.curve("omakase-snap", {
--     type = "bezier",
--     points = {
--         { 0.16, 1.0 },
--         { 0.30, 1.0 },
--     },
-- })

-- hl.animation({
--     leaf = "windows",
--     enabled = true,
--     speed = 4,
--     bezier = "omakase-snap",
--     -- style = "slide",
-- })

-- hl.animation({
--     leaf = "workspaces",
--     enabled = true,
--     speed = 5,
--     bezier = "omakase-snap",
--     style = "slidefade 20%",
-- })

-- hl.animation({
--     leaf = "layers",
--     enabled = true,
--     speed = 4,
--     bezier = "omakase-snap",
-- })

-- hl.animation({
--     leaf = "fade",
--     enabled = true,
--     speed = 4,
--     bezier = "omakase-snap",
-- })

hl.config({
    general = {
        gaps_in = 2,
        gaps_out = 5,
        border_size =3,
        col = {
            active_border = {
                colors = {
                    theme.accent,
                    theme.magenta,                },
                angle = 45,
            },

            inactive_border = theme.muted,
        },

        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },

    decoration = {
        rounding = 1,
        rounding_power = 2,

        -- active_opacity = 1.0,
        -- inactive_opacity = 1.0,

        shadow = {
            enabled = false,
            range = 4,
            render_power = 3,
            color = theme.darker_background .. "cc",
        },

        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },

    dwindle = {
        preserve_split = true,
    },

    input = {
        kb_layout = "us",
        follow_mouse = 1,
        sensitivity = 0,

        touchpad = {
            natural_scroll = true,
        },
    },

    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
    },
})
