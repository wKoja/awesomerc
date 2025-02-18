local beautiful = require("beautiful")
local wibox = require("wibox")

local configuration = require("configuration.config")
require("widgets.top-panel")

-- Separators
local spr = wibox.widget.textbox(" ")
local arrow_color = beautiful.grey

local apply_background = function(w) return wibox.container.background(w, arrow_color) end

local TopPanel = function(s)
  -- Wiboxes are much more flexible than wibars simply for the fact that there are no defaults, however if you'd rather have the ease of a wibar you can replace this with the original wibar code
  local panel = wibox({
    ontop = true,
    screen = s,
    height = configuration.toppanel_height,
    width = s.geometry.width,
    x = s.geometry.x,
    y = s.geometry.y,
    stretch = false,
    bg = beautiful.background,
    fg = beautiful.fg_normal,
    struts = {
      top = configuration.toppanel_height,
    },
  })

  panel:struts({
    top = configuration.toppanel_height,
  })
  --

  if s.index == 2 then
    panel:setup({
      layout = wibox.layout.align.horizontal,
      { -- Left widgets
        layout = wibox.layout.fixed.horizontal,
        s.mytaglist,
        s.mypromptbox,
      },
      s.mytasklist, -- Middle widget
      { -- Right widgets
        layout = wibox.layout.fixed.horizontal,
        spr,
        s.mylayoutbox,
      },
    })
  else
    panel:setup({
      layout = wibox.layout.align.horizontal,
      { -- Left widgets
        layout = wibox.layout.fixed.horizontal,
        s.mytaglist,
        s.mypromptbox,
      },
      s.mytasklist, -- Middle widget
      { -- Right widgets
        layout = wibox.layout.fixed.horizontal,
        apply_background(mykeyboardlayout),
        musicplayer,
        volume,
        apply_background(fsroothome),
        battery,
        cpu_coretemp,
        cpu,
        awm_widgets.cpu_widget({
          width = 70,
          step_width = 2,
          step_spacing = 0,
          color = "#434c5e",
        }),
        apply_background(mem),
        wibox.widget.systray(),
        mytextclock,
        spr,
        s.mylayoutbox,
      },
    })
  end

  return panel
end

return TopPanel
