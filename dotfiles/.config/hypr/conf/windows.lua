--#############################
--## WINDOWS AND WORKSPACES ###
--#############################

-- See https://wiki.hypr.land/Configuring/Window-Rules/ for more
-- See https://wiki.hypr.land/Configuring/Workspace-Rules/ for workspace rules

hl.window_rule({
    name = "suppress-maximize-events",
    match = {
        class = ".*",
    },
    suppress_event = "maximize",
})

-- Fix some dragging issues with XWayland
hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})

-- Float Wi-Fi settings
hl.window_rule({
    name = "nm-connection-editor",
    match = {
        class = "^(nm-connection-editor)$",
    },
    float = true,
})

-- Float Bluetooth settings
hl.window_rule({
    name = "blueman-manager",
    match = {
        class = "^(blueman-manager)$",
    },
    float = true,
})

-- clipse
hl.window_rule({
    name = "clipse-gui",
    match = {
        class = "^(clipse-gui)$",
    },
    float = true,
    center = true,
    size = "800 600",
})

hl.window_rule({
    name = "waybar-tooltip",
    match = {
        class = "^(waybar)$",
        title = "^(waybar-tooltip)$",
    },
    float = true,
})