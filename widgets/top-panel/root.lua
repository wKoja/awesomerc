local lain = require "lain"
local beautiful = require "beautiful"

local markup = lain.util.markup

fsroothome = lain.widget.fs {
    settings = function()
        widget:set_markup(
            markup.fontfg(
                beautiful.font,
                beautiful.red,
                " root: "
                .. math.floor(fs_now["/"].used)
                .. fs_now["/"].units
                .. "/"
                .. math.floor(fs_now["/"].size)
                .. fs_now["/"].units
                .. " "
            )
        )
    end,
}
