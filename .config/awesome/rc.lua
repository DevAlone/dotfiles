local globals = require("globals")

local beautiful = require("beautiful")
local awful = require("awful")
require("awful.autofocus")

require("error_handling")

-- activate theme
beautiful.init(globals.themes_dir .. globals.theme_name .. "/theme.lua")

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.max,
    awful.layout.suit.tile,
    awful.layout.suit.floating,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.corner.nw,
    awful.layout.suit.fair,
}

require("panel")
require("keys")
require("rules")
require("signals")

awful.spawn.with_shell("~/.config/awesome/autorun.py")
