-- -----------------------------------------------------
-- Monitor
-- -----------------------------------------------------

require("conf.monitors")

-- -----------------------------------------------------
-- Gesture
-- -----------------------------------------------------
require("conf.gesture")

-- -----------------------------------------------------
-- Exec-once
-- -----------------------------------------------------
require("conf.exec-once")

-- -----------------------------------------------------
-- Programs
-- -----------------------------------------------------
-- Source: ~/.config/hypr/conf/programs.lua 
local programs = require("conf.programs")
terminal = programs.terminal
fileManager = programs.fileManager
menu = programs.menu
browser = programs.browser

-- -----------------------------------------------------
-- Environment
-- -----------------------------------------------------
-- Source: ~/.config/hypr/conf/environment.lua — convert this file to Lua and ensure it is on Lua's package.path.
require("conf.environment")

-- -----------------------------------------------------
-- Autostart
-- -----------------------------------------------------
require("conf.autostart")

-- -----------------------------------------------------
-- Load configuration files
-- -----------------------------------------------------
require("conf.windows")
require("conf.layout")
require("conf.keybinds")

-- -----------------------------------------------------
-- Animation
-- -----------------------------------------------------
-- Source: ~/.config/hypr/conf/animations.lua — convert this file to Lua and ensure it is on Lua's package.path.
require("conf.animations")

--##################
--## PERMISSIONS ###
--##################

-- See https://wiki.hypr.land/Configuring/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- ecosystem {
--   enforce_permissions = 1
-- }

-- permission = /usr/(bin|local/bin)/grim, screencopy, allow
-- permission = /usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland, screencopy, allow
-- permission = /usr/(bin|local/bin)/hyprpm, plugin, allow

-- Ref https://wiki.hypr.land/Configuring/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- workspace = w[tv1], gapsout:0, gapsin:0
-- workspace = f[1], gapsout:0, gapsin:0
-- windowrule = bordersize 0, floating:0, onworkspace:w[tv1]
-- windowrule = rounding 0, floating:0, onworkspace:w[tv1]
-- windowrule = bordersize 0, floating:0, onworkspace:f[1]
-- windowrule = rounding 0, floating:0, onworkspace:f[1]