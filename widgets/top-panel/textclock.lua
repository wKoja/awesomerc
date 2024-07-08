local wibox = require("wibox")
local calendar_widget = require("awesome-wm-widgets.calendar-widget.calendar")

-- Create a textclock widget
mytextclock = wibox.widget.textclock()

local cw = calendar_widget({
    theme = 'nord',
    placement = 'top_right',
    start_sunday = true,
    radius = 8,
-- with customized next/previous (see table above)
    previous_month_button = 1,
    next_month_button = 3,
})
mytextclock:connect_signal("button::press",
    function(_, _, _, button)
        if button == 1 then cw.toggle() end
    end)
