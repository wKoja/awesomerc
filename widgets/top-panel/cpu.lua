local lain = require "lain"
local beautiful = require "beautiful"

local markup = lain.util.markup

cpu = lain.widget.cpu {
	timeout = 1,
	settings = function()
		widget:set_markup(markup.fontfg(beautiful.font, beautiful.yellow, "CPU " .. cpu_now.usage .. "%"))
	end,
}

cpu_coretemp = lain.widget.temp({
	settings = function ()
		widget:set_markup(markup.fontfg(beautiful.font, beautiful.yellow, " " .. coretemp_now .. "°C "))
	end
})
