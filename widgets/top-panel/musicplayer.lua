local lain = require "lain"
local beautiful = require("beautiful")

local markup = lain.util.markup

musicplayer = lain.widget.mpd({
  settings = function()
    if mpd_now.state == "play" then
      local artist = " " .. mpd_now.artist .. " - "
      local title =  mpd_now.title .. " "
      widget:set_markup(markup.fontfg(beautiful.font, beautiful.blue, artist .. title))
    elseif mpd_now.state == "pause" then
      widget:set_markup(" mpd paused ")
    else
      widget:set_markup("")
    end
  end,
})
