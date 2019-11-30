local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup").widget

local globals = {}

globals.home_dir = os.getenv("HOME")
globals.conf_dir = globals.home_dir .. "/.config/awesome/"
globals.themes_dir = globals.conf_dir .. "themes/"
-- "win" key
globals.modkey = "Mod4"
-- change to choose another theme
globals.theme_name = "default"
globals.terminal_emulator = "konsole"
globals.text_editor = os.getenv("EDITOR") or "vim"
globals.editor_command = globals.terminal_emulator .. " -e " .. globals.text_editor
local awesome_menu = {
    {"restart awesome", awesome.restart},
    {
        "close awesome",
        function()
            awesome.quit()
        end,
    },
}
local system_menu = {
    {
        "shutdown system",
        function()
            awful.spawn("shutdown 0")
        end,
    },
    {
        "reboot system",
        function()
            awful.spawn("reboot")
        end,
    },
}
globals.mymainmenu = awful.menu(
                         {
        items = {
            {
                "show hotkeys",
                function()
                    return false, hotkeys_popup.show_help
                end,
            },
            {"open terminal", globals.terminal_emulator},
            {"awesome", awesome_menu},
            {"system", system_menu},
        },
    }
                     )

globals.tags = {"1", "q", "w", "e", "r", "t", "y", "u", "i", "o", "p", "[", "]"}

globals.clock_format = "%a %b %d.%m.%y | %H:%M:%S"
globals.update_clock_each_n_seconds = 1
globals.panel_position = "bottom"

return globals
