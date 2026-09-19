for i = 1, 10 do
    local key = i % 10

    hl.bind(
        "SUPER + " .. key,
        hl.dsp.focus({ workspace = i })
    )

    hl.bind(
        "SUPER + SHIFT + " .. key,
        hl.dsp.window.move({ workspace = i })
    )

    hl.bind(
        "SUPER + ALT + " .. key,
        hl.dsp.window.move({
            workspace = i,
            follow = true,
        })
    )
end
