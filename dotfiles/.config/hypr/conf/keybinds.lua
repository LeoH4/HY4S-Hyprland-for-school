--##################
--## KEYBINDINGS ###
--##################
-- See https://wiki.hypr.land/Configuring/Keywords/

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Binds/ for more

-- name: Terminal
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))

-- name: Kill active window
hl.bind(mainMod .. " + Q", hl.dsp.window.close())

-- name: Hyprlock
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))

-- name: File Manager
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))

-- name: Keybinds list
hl.bind(mainMod .. " + K", hl.dsp.exec_cmd("~/.config/rofi/scripts/keybinds.sh"))

-- name: Config quick-nav
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("~/.config/rofi/scripts/config-navigation.sh"))

-- name: Toggle floating window
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))

-- name: Application launcher
hl.bind("ALT" .. " + " .. mainMod .. " + RETURN", hl.dsp.exec_cmd(menu))

-- name: Pseudo tile (dwindle)
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())

-- name: Toggle split (dwindle)
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))

-- name: Browser
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))

-- name: Reload waybar
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("~/.config/waybar/scripts/launch.sh"))

-- name: Fullscreen
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

-- name: Screenshot (region)
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | swappy -f - | tee >(wl-copy)"))

-- name: Clipboard manager
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("clipse-gui"))

-- name: Emoji picker
hl.bind(mainMod .. " + PERIOD", hl.dsp.exec_cmd("~/.config/hypr/scripts/emoji-picker.sh"))

-- name: Move focus left
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))

-- name: Move focus right
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))

-- name: Move focus up
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))

-- name: Move focus down
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- name: Workspace 1-10
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
end

-- name: Move to workspace 1-10
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- name: Terminal scratchpad
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("hyprscratch term \"[size 75% 75%] foot --title term\""))

-- name: NeoVim scratchpad
hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd("hyprscratch notes \"[size 60% 70%] foot --title notes -e nvim\""))

-- name: Next workspace (scroll)
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))

-- name: Previous workspace (scroll)
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- name: Move window (mouse)
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })

-- name: Resize window (mouse)
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness

-- name: Volume up
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("~/.config/hypr/scripts/volume-notify.sh --inc"), { locked = true, repeating = true })

-- name: Volume down
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("~/.config/hypr/scripts/volume-notify.sh --dec"), { locked = true, repeating = true })

-- name: Toggle mute
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("~/.config/hypr/scripts/volume-notify.sh --toggle"), { locked = true, repeating = true })

-- name: Brightness up
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("~/.config/hypr/scripts/brightness-notify.sh --inc"), { locked = true, repeating = true })

-- name: Brightness down
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("~/.config/hypr/scripts/brightness-notify.sh --dec"), { locked = true, repeating = true })

-- name: Next track
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })

-- name: Play/Pause
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })

-- name: Play/Pause
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })

-- name: Previous track
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })