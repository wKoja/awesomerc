local lain = require "lain"
local beautiful = require "beautiful"

local markup = lain.util.markup

mem = lain.widget.mem {
  timeout = 1,
  settings = function()
    widget:set_markup(
      markup.fontfg(
        beautiful.font,
        beautiful.green,
        " RAM "
        .. mem_now.perc
        .. "%"
        .. " "
        .. math.floor(mem_now.used / 1000)
        .. "GB/"
        .. math.floor(mem_now.total / 1000)
        .. "GB "
      )
    )
  end,
}
