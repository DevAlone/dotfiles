local awful = require("awful")

local helpers = {}

-- {{{ Helper functions
function helpers.client_menu_toggle_fn()
    local instance = nil

    return function()
        if instance and instance.wibox.visible then
            instance:hide()
            instance = nil
        else
            instance = awful.menu.clients({theme = {width = 250}})
        end
    end
end
-- }}}

return helpers
