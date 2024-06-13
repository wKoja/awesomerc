local battery_widget = require "awesome-wm-widgets.battery-widget.battery"

battery = nil

local handle = io.popen("echo $HOSTNAME", "r")
local result = handle:read "*l"
handle:close()

-- only showing battery info on my laptop
if result == "archpad" then battery = battery_widget {
  show_current_level = true,
} end
