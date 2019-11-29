local globals = require("globals")

local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")

local clientbuttons = gears.table.join(
                          awful.button(
                              {}, 1, function(c)
            client.focus = c
            c:raise()
        end
                          ), awful.button({globals.modkey}, 1, awful.mouse.client.move),
                          awful.button({globals.modkey}, 3, awful.mouse.client.resize)
                      )

local clientkeys = gears.table.join(
                       awful.key(
                           {globals.modkey}, "f", function(c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end, {description = "toggle fullscreen", group = "client"}
                       ), awful.key(
                           {globals.modkey, "Shift"}, "c", function(c)
            c:kill()
        end, {description = "close", group = "client"}
                       ), awful.key(
                           {globals.modkey, "Control"}, "space", awful.client.floating.toggle,
                           {description = "toggle floating", group = "client"}
                       ), awful.key(
                           {globals.modkey, "Control"}, "Return", function(c)
            c:swap(awful.client.getmaster())
        end, {description = "move to master", group = "client"}
                       ), awful.key(
                           {globals.modkey}, "9", function(c)
            c:move_to_screen()
        end, {description = "move to screen", group = "client"}
                       ), awful.key(
                           {globals.modkey}, "5", function(c)
            c.ontop = not c.ontop
        end, {description = "toggle keep on top", group = "client"}
                       ), awful.key(
                           {globals.modkey}, "n", function(c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end, {description = "minimize", group = "client"}
                       ), awful.key(
                           {globals.modkey}, "m", function(c)
            c.maximized = not c.maximized
            c:raise()
        end, {description = "(un)maximize", group = "client"}
                       ), awful.key(
                           {globals.modkey, "Control"}, "m", function(c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end, {description = "(un)maximize vertically", group = "client"}
                       ), awful.key(
                           {globals.modkey, "Shift"}, "m", function(c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end, {description = "(un)maximize horizontally", group = "client"}
                       )
                   )

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    {
        rule = {},
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = clientkeys,
            buttons = clientbuttons,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap + awful.placement.no_offscreen,
            --		     size_hints_honor = false
        },
    },

    -- Floating clients.
    {
        rule_any = {
            instance = {
                "DTA", -- Firefox addon DownThemAll.
                "copyq", -- Includes session name in class.
            },
            class = {
                "Arandr",
                "Gpick",
                "Kruler",
                "MessageWin", -- kalarm.
                "Sxiv",
                "Wpa_gui",
                "pinentry",
                "veromix",
                "xtightvncviewer",
            },

            name = {
                "Event Tester", -- xev.
            },
            role = {
                "AlarmWindow", -- Thunderbird's calendar.
                "pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
                "PictureInPicture",
            },
        },
        properties = {floating = true},
    },

    -- Add titlebars to normal clients and dialogs
    {rule_any = {type = {"normal", "dialog"}}, properties = {titlebars_enabled = true}},

    -- Set Firefox to always map on the tag named "2" on screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { screen = 1, tag = "2" } },
    -- { rule = { class = "Firefox" },
    --   properties = { tag = "1" } },
}
-- }}}
