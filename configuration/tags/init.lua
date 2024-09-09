local awful = require("awful")

-- Configure Tag Properties
awful.screen.connect_for_each_screen(function(s)
  -- Each screen has its own tag table.
  awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])
end)
-- }}}

-- Table of layouts to cover with awful.layout.inc, order matters.
-- Use awful.layout.set with keyboard shortcuts
awful.layout.layouts = {
  awful.layout.suit.floating,
  awful.layout.suit.max,
  awful.layout.suit.tile,
  awful.layout.suit.tile.top,
  -- awful.layout.suit.spiral,
  -- awful.layout.suit.spiral.dwindle,
  -- awful.layout.suit.max.fullscreen,
  -- awful.layout.suit.magnifier,
  -- awful.layout.suit.corner.nw,
  -- awful.layout.suit.corner.ne,
  -- awful.layout.suit.corner.sw,
  -- awful.layout.suit.corner.se,
}
-- }}}
