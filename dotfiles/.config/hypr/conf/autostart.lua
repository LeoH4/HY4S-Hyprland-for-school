--################
--## AUTOSTART ###
--################

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

-- exec-once = $terminal
-- exec-once = nm-applet &

--clipse-tui

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("swaync")
    hl.exec_cmd("swww-daemon")
    hl.exec_cmd("swayosd-server")
    hl.exec_cmd("clipse -listen")
    hl.exec_cmd("hyprpaper")
end)