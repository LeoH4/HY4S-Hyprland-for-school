--############################
--## ENVIRONMENT VARIABLES ###
--############################

-- See https://wiki.hypr.land/Configuring/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

--####################
--## LOOK AND FEEL ###
--####################

-- Refer to https://wiki.hypr.land/Configuring/Variables/

-- https://wiki.hypr.land/Configuring/Variables/#general
hl.config({
    general = {
        gaps_in = 4,
        gaps_out = { top = 16, right = 16, bottom = 16, left = 80 },
        border_size = 2,
        col = {
            active_border = "rgba(186,187,38,1.0)",
            inactive_border = "rgba(104,86,245,0.8)",
        },
        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",
    },
    decoration = {
        rounding = 24,
        rounding_power = 3,
        active_opacity = 0.95,
        inactive_opacity = 0.9,
        shadow = {
            enabled = true,
            range = 55,
            render_power = 10,
            color = "rgba(1a1a1aff)",
        },
        blur = {
            enabled = true,
            size = 6,
            passes = 1,
            ignore_opacity = true,
            contrast = 2,
            brightness = 1,
            new_optimizations = true,
        },
    },
})

hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")