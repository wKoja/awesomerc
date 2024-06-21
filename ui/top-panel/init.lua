local awful = require "awful"
local beautiful = require "beautiful"
local wibox = require "wibox"
local gears = require "gears"
local lain = require "lain"

configuration = require "configuration.config"
require "widgets.top-panel"

-- Separators
local separators = lain.util.separators
local spr = wibox.widget.textbox " "
local arrow_color = beautiful.grey
local arrl_dl = separators.arrow_left(arrow_color, "alpha")
local arrl_ld = separators.arrow_left("alpha", arrow_color)

local apply_background = function(w) return wibox.container.background(w, arrow_color) end

local TopPanel = function(s)
  -- Wiboxes are much more flexible than wibars simply for the fact that there are no defaults, however if you'd rather have the ease of a wibar you can replace this with the original wibar code
  local panel = wibox {
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
  }

  panel:struts {
    top = configuration.toppanel_height,
  }
  --

  if s.index == 2 then
    panel:setup {
      layout = wibox.layout.align.horizontal,
      { -- Left widgets
        layout = wibox.layout.fixed.horizontal,
        s.mytaglist,
        s.mypromptbox,
      },
      s.mytasklist, -- Middle widget
      {             -- Right widgets
        layout = wibox.layout.fixed.horizontal,
        spr,
        s.mylayoutbox,
      },
    }
  else
    panel:setup {
      layout = wibox.layout.align.horizontal,
      { -- Left widgets
        layout = wibox.layout.fixed.horizontal,
        s.mytaglist,
        s.mypromptbox,
      },
      s.mytasklist, -- Middle widget
      {             -- Right widgets
        layout = wibox.layout.fixed.horizontal,
        arrl_ld,
        apply_background(mykeyboardlayout),
        arrl_dl,
        musicplayer,
        spr,
        volume,
        spr,
        arrl_ld,
        apply_background(fsroothome),
        arrl_dl,
        spr,
        battery,
        spr,
        cpu_coretemp,
        cpu,
        awm_widgets.cpu_widget {
          width = 70,
          step_width = 2,
          step_spacing = 0,
          color = "#434c5e",
        },
        arrl_ld,
        apply_background(mem),
        arrl_dl,
        spr,
        wibox.widget.systray(),
        spr,
        mytextclock,
        spr,
        s.mylayoutbox,
      },
    }
  end

  return panel
end

return TopPanel
