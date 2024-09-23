local lain = require("lain")
local awful = require("awful")

volume = lain.widget.pulse({
  timeout = 0.1,
  settings = function()
    vlevel = " vol " .. volume_now.left .. "% "
    if volume_now.muted == "yes" then vlevel = vlevel .. " M " end
    widget:set_markup(lain.util.markup("#7493d2", vlevel))
  end,
})

volume.widget:buttons(awful.util.table.join(
  awful.button({}, 1, function() -- left click
    awful.spawn("pavucontrol")
  end),
  awful.button({}, 3, function() -- right click
    os.execute(string.format("pactl set-sink-mute %s toggle", volume.device))
    volume.update()
  end),
  awful.button({}, 4, function() -- scroll up
    os.execute(string.format("pactl set-sink-volume %s +1%%", volume.device))
    volume.update()
  end),
  awful.button({}, 5, function() -- scroll down
    os.execute(string.format("pactl set-sink-volume %s -1%%", volume.device))
    volume.update()
  end)
))
