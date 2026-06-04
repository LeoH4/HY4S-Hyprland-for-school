--################
--## EXEC-ONCE ###
--################

hl.on("hyprland.start", function()
    hl.exec_cmd("nm-applet --indicator")
    hl.exec_cmd("blueman-applet")
    hl.exec_cmd("hyprscratch init clean eager")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("waybar")
    hl.exec_cmd("swaync")
    hl.exec_cmd("swww-daemon")
    hl.exec_cmd("swayosd-server")
    hl.exec_cmd("clipse -listen")
end)