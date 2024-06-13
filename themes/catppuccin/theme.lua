---------------------------
-- catppuccin awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local themes_path = os.getenv("HOME") .. "/.config/awesome/themes/"

local theme = {}

theme.font = "JetBrainsMono Nerd Font 10"

theme.useless_gap = 0
theme.border_width = 1

theme.black = "#1e1e28"
theme.deep_black = "#1b1923"
theme.white = "#d7dae0"
theme.light_white = "#fafafa"
theme.pink = "#f0afe1"
theme.red = "#e28c8c"
theme.orange = "#f9c096"
theme.yellow = "#eadda0"
theme.green = "#b3e1a3"
theme.blue = "#a4b9ef"
theme.purple = "#c6aae8"
theme.grey = "#6e6c7c"

theme.bg_normal = theme.black
theme.bg_focus = theme.deep_black
theme.bg_urgent = theme.white
theme.bg_minimize = theme.grey
theme.bg_systray = theme.black

theme.fg_normal = theme.white
theme.fg_focus = theme.orange
theme.fg_urgent = theme.red
theme.fg_minimize = theme.light_white

theme.border_normal = theme.blue
theme.border_focus = theme.red
theme.border_marked = theme.purple

-- There are other variable sets
-- overriding the catppuccin one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)
theme.taglist_disable_icon = true

-- Variables set for theming notifications:
theme.notification_font = "JetBrainsMono Nerd Font 12"
theme.notification_margin = dpi(10)
theme.notification_border_color = theme.border_normal
theme.notification_border_width = theme.border_width
theme.notification_icon_size = dpi(60)

-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path .. "catppuccin/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua

-- Define the image to load
theme.titlebar_close_button_normal = themes_path .. "catppuccin/titlebar/close_normal.png"
theme.titlebar_close_button_focus = themes_path .. "catppuccin/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path .. "catppuccin/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus = themes_path .. "catppuccin/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = themes_path .. "catppuccin/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive = themes_path .. "catppuccin/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path .. "catppuccin/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active = themes_path .. "catppuccin/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path .. "catppuccin/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive = themes_path .. "catppuccin/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path .. "catppuccin/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active = themes_path .. "catppuccin/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path .. "catppuccin/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive = themes_path .. "catppuccin/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path .. "catppuccin/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active = themes_path .. "catppuccin/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path .. "catppuccin/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive = themes_path .. "catppuccin/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path .. "catppuccin/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active = themes_path .. "catppuccin/titlebar/maximized_focus_active.png"

theme.wallpaper = themes_path .. "catppuccin/background.png"

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path .. "catppuccin/layouts/fairhw.png"
theme.layout_fairv = themes_path .. "catppuccin/layouts/fairvw.png"
theme.layout_floating = themes_path .. "catppuccin/layouts/floatingw.png"
theme.layout_magnifier = themes_path .. "catppuccin/layouts/magnifierw.png"
theme.layout_max = themes_path .. "catppuccin/layouts/maxw.png"
theme.layout_fullscreen = themes_path .. "catppuccin/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path .. "catppuccin/layouts/tilebottomw.png"
theme.layout_tileleft = themes_path .. "catppuccin/layouts/tileleftw.png"
theme.layout_tile = themes_path .. "catppuccin/layouts/tilew.png"
theme.layout_tiletop = themes_path .. "catppuccin/layouts/tiletopw.png"
theme.layout_spiral = themes_path .. "catppuccin/layouts/spiralw.png"
theme.layout_dwindle = themes_path .. "catppuccin/layouts/dwindlew.png"
theme.layout_cornernw = themes_path .. "catppuccin/layouts/cornernww.png"
theme.layout_cornerne = themes_path .. "catppuccin/layouts/cornernew.png"
theme.layout_cornersw = themes_path .. "catppuccin/layouts/cornersww.png"
theme.layout_cornerse = themes_path .. "catppuccin/layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = "/usr/share/icons/Papirus"

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
