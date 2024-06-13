local lain = require "lain"
local beautiful = require "beautiful"
local volume_widget = require('awesome-wm-widgets.volume-widget.volume')

local markup = lain.util.markup

-- volume = lain.widget.alsa {
-- 	timeout = 1,
-- 	settings = function()
-- 	  local status = volume_now.status
-- 	  local vol = volume_now.level
-- 	  if status == 'off' then
-- 	   vol = 'muted'
-- 	  end
-- 		widget:set_markup(markup.fontfg(beautiful.font, beautiful.blue, "vol " .. vol))
-- 	end,
-- }

volume = volume_widget({
  widget_type = 'vertical_bar',
})

volume_num = volume_widget({
  widget_type = "icon_and_text"
})
