local programs = require("programs")

local mainMod = "SUPER"

hl.bind(
    mainMod .. " + L",
    hl.dsp.exec_cmd("loginctl lock-session")
)

hl.bind(
    mainMod .. " + Q",
    hl.dsp.exec_cmd(programs.terminal)
)

hl.bind(
    mainMod .. " + E",
    hl.dsp.exec_cmd(programs.file_manager)
)

hl.bind(
    mainMod .. " + B",
    hl.dsp.exec_cmd(programs.browser)
)

hl.bind(
    mainMod .. " + Y",
    hl.dsp.exec_cmd(programs.second_browser)
)

hl.bind(
    mainMod .. " + W",
    hl.dsp.window.close()
)

hl.bind(
    mainMod .. " + V",
    hl.dsp.window.float({ action = "toggle" })
)

hl.bind(
    mainMod .. " + P",
    hl.dsp.window.pseudo()
)

hl.bind(
    mainMod .. " + J",
    hl.dsp.layout("togglesplit")
)

hl.bind(
    mainMod .. " + left",
    hl.dsp.focus({ direction = "left" })
)

hl.bind(
    mainMod .. " + right",
    hl.dsp.focus({ direction = "right" })
)

hl.bind(
    mainMod .. " + up",
    hl.dsp.focus({ direction = "up" })
)

hl.bind(
    mainMod .. " + down",
    hl.dsp.focus({ direction = "down" })
)

hl.bind(
    mainMod .. " + mouse:272",
    hl.dsp.window.drag(),
    { mouse = true }
)

hl.bind(
    mainMod .. " + mouse:273",
    hl.dsp.window.resize(),
    { mouse = true }
)
