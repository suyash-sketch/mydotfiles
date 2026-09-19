local noctalia = "noctalia msg "

hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd(noctalia .. "brightness-up")
)

hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd(noctalia .. "brightness-down")
)

hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd(noctalia .. "volume-up")
)

hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd(noctalia .. "volume-down")
)

hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd(noctalia .. "volume-mute")
)

hl.bind(
    "XF86AudioMicMute",
    hl.dsp.exec_cmd(noctalia .. "mic-mute"),
    { locked = true }
)

hl.bind(
    "SUPER + Space",
    hl.dsp.exec_cmd(noctalia .. "panel-toggle launcher")
)

hl.bind(
    "SUPER + S",
    hl.dsp.exec_cmd(noctalia .. "panel-toggle control-center")
)

hl.bind(
    "SUPER + comma",
    hl.dsp.exec_cmd(noctalia .. "settings-toggle")
)

hl.bind(
    "ALT + Tab",
    hl.dsp.exec_cmd(noctalia .. "window-switcher")
)

hl.bind(
    "PRINT",
    hl.dsp.exec_cmd(noctalia .. "screenshot-region")
)

hl.bind(
    "SHIFT + PRINT",
    hl.dsp.exec_cmd(noctalia .. "screenshot-fullscreen")
)

hl.layer_rule({
    name = "noctalia",
    match = {
        namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$",
    },
    no_anim = true,
    ignore_alpha = 0.5,
    blur = true,
    blur_popups = true,
})
