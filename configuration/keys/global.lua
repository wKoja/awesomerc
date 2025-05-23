local awful = require('awful')
local gears = require("gears")

require('awful.autofocus')
local hotkeys_popup = require('awful.hotkeys_popup').widget

local modkey = require('configuration.keys.mod').modKey
local apps = require('configuration.apps')

-- {{{ Key bindings
globalKeys = gears.table.join(
  awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
    {description="show help", group="awesome"}),

  awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
    {description = "view previous", group = "tag"}),
  awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
    {description = "view next", group = "tag"}),

  awful.key({ modkey, "Shift" }, "Left",
    function ()
      -- get current tag
      local t = client.focus and client.focus.first_tag or nil
      if t == nil then
        return
      end
      -- get previous tag (modulo 9 excluding 0 to wrap from 1 to 9)
      local tag = client.focus.screen.tags[(t.index - 2) % 9 + 1]
      awful.client.movetotag(tag)
      awful.tag.viewprev()
    end,
    {description = "move client to previous tag and switch to it", group = "tag"}),

  awful.key({ modkey, "Shift" }, "Right",
    function ()
      -- get current tag
      local t = client.focus and client.focus.first_tag or nil
      if t == nil then
        return
      end
      -- get next tag (modulo 9 excluding 0 to wrap from 9 to 1)
      local tag = client.focus.screen.tags[(t.index % 9) + 1]
      awful.client.movetotag(tag)
      awful.tag.viewnext()
    end,
    {description = "move client to next tag and switch to it", group = "tag"}),

  awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
    {description = "go back", group = "tag"}),

  awful.key({ modkey,           }, "j",
    function ()
      awful.client.focus.byidx( 1)
    end,
    {description = "focus next by index", group = "client"}
  ),
  awful.key({ modkey,           }, "k",
    function ()
      awful.client.focus.byidx(-1)
    end,
    {description = "focus previous by index", group = "client"}
  ),

  -- Layout manipulation
  awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
    {description = "swap with next client by index", group = "client"}),
  awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
    {description = "swap with previous client by index", group = "client"}),
  awful.key({ modkey, "Control" }, "h", function () awful.screen.focus_relative( 1) end,
    {description = "focus the next screen", group = "screen"}),
  awful.key({ modkey, "Control" }, "l", function () awful.screen.focus_relative(-1) end,
    {description = "focus the previous screen", group = "screen"}),
  awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
    {description = "jump to urgent client", group = "client"}),
  awful.key({ modkey,           }, "Tab",
    function ()
      awful.client.focus.history.previous()
      if client.focus then
        client.focus:raise()
      end
    end,
    {description = "go back", group = "client"}),

  -- Standard program
  awful.key({ modkey,           }, "Return", function () awful.spawn(apps.terminal) end,
    {description = "open a terminal", group = "launcher"}),
  awful.key({modkey,            }, "BackSpace", function() awful.spawn(apps.sysact) end,
    {description = "open browser", group = "launcher"}),
  awful.key({modkey,            }, "w", function() awful.spawn(apps.browser) end,
    {description = "open browser", group = "launcher"}),
  awful.key({modkey,   "Shift"  }, "w", function() awful.spawn(apps.network_manager_cmd) end,
    {description = "open browser", group = "launcher"}),
  awful.key({modkey,  "Shift"   }, "h", function() apps.change_lang() end,
    {description = "change language", group = "launcher"}),
  awful.key({modkey,  "Shift"   }, "d", function() awful.spawn(apps.password_manager) end,
    {description = "change language", group = "launcher"}),
  awful.key({modkey             }, "b", function() apps.toggle_bar_visibility() end,
    {description = "toggle top bar visibility", group = "launcher"}),
  awful.key({modkey,  "Shift"   }, "Return", function() awful.spawn(apps.scratchpad:toggle()) end,
    {description = "password manager", group = "launcher"}),
  awful.key({modkey,            }, "'", function () awful.spawn(apps.calculator) end,
    {description = "calculator", group = "launcher"}),
  awful.key({modkey,            }, "`", function () awful.spawn(apps.emojipicker) end,
    {description = "emoji picker", group = "launcher"}),
  awful.key({modkey,            }, "F9", function() awful.spawn(apps.mounter) end,
    {description = "mounter", group = "launcher"}),
  awful.key({modkey,            }, "F10", function() awful.spawn(apps.unmounter) end,
    {description = "unmounter", group = "launcher"}),
  -- volume control
  awful.key({}, "XF86AudioMute", function() awful.spawn(apps.mute_audio) end,
    {description = "mute audio", group = "launcher"}),
  awful.key({}, "XF86AudioRaiseVolume", function() awful.spawn(apps.volume_up) end,
    {description = "volume up", group = "launcher"}),
  awful.key({}, "XF86AudioLowerVolume", function() awful.spawn(apps.volume_down) end,
    {description = "volume down", group = "launcher"}),
  -- player controls
  awful.key({modkey            }, "m", function() awful.spawn(apps.music_player_cmd) end,
    {description = "open music player", group = "launcher"}),
  awful.key({modkey,    "Shift"}, "F7", function() awful.spawn(apps.music_player_previous_cmd) end,
    {description = "music previous", group = "launcher"}),
  awful.key({modkey,    "Shift"}, "F8", function() awful.spawn(apps.music_player_toggle_cmd) end,
    {description = "music pause/unpause", group = "launcher"}),
  awful.key({modkey,    "Shift"}, "F9", function() awful.spawn(apps.music_player_next_cmd) end,
    {description = "music next", group = "launcher"}),
  -- screen recording and screenshots
  awful.key({       "Shift"     }, "XF86AudioMute", function() awful.spawn(apps.screenshot) end,
    {description = "take screenshot", group = "launcher"}),
  awful.key({       "Shift"     }, "Print", function() awful.spawn(apps.screenshot) end,
    {description = "take screenshot", group = "launcher"}),
  awful.key({modkey,   "Shift"  }, "XF86AudioMute", function() awful.spawn(apps.record_screen) end,
    {description = "record screen", group = "launcher"}),
  awful.key({modkey,   "Shift"  }, "Delete", function() awful.spawn(apps.stop_record_screen) end,
    {description = "stop record screen", group = "launcher"}),
  -- brightness control
  awful.key({modkey,   "Shift"  }, "=", function() apps.brightness_up("+30") end,
    {description = "brightness up", group = "launcher"}),
  awful.key({modkey,   "Shift"  }, "-", function() apps.brightness_down("-30") end,
    {description = "brightness down", group = "launcher"}),
  awful.key({}, "XF86MonBrightnessUp", function() awful.spawn("xbacklight -inc 15") end,
    {description = "brightness up", group = "launcher"}),
  awful.key({}, "XF86MonBrightnessDown", function() awful.spawn("xbacklight -dec 15") end,
    {description = "brightness down", group = "launcher"}),
  -- file explorer
  awful.key({modkey,            }, "r", function() awful.spawn(apps.explorer_cmd) end,
    {description = "open file explorer", group = "launcher"}),
  -- process monitor
  awful.key({modkey,  "Shift"   }, "r", function() awful.spawn(apps.btop_cmd) end,
    {description = "open bash top", group = "launcher"}),
  awful.key({ modkey, "Control" }, "r", awesome.restart,
    {description = "reload awesome", group = "awesome"}),
  awful.key({ modkey, "Shift"   }, "e", awesome.quit,
    {description = "quit awesome", group = "awesome"}),

  -- torrenting
  awful.key({ modkey, "Shift" }, "t", function() awful.spawn(apps.torrent_client_cmd) end,
    {description = "open torrenter", group = "launcher"}),

  awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
    {description = "increase master width factor", group = "layout"}),
  awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
    {description = "increase the number of master clients", group = "layout"}),
  awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
    {description = "decrease the number of master clients", group = "layout"}),
  awful.key({ modkey, "Control" }, "=",     function () awful.tag.incncol( 1, nil, true)    end,
    {description = "increase the number of columns", group = "layout"}),
  awful.key({ modkey, "Control" }, "-",     function () awful.tag.incncol(-1, nil, true)    end,
    {description = "decrease the number of columns", group = "layout"}),
  awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
    {description = "select next", group = "layout"}),
  awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
    {description = "select previous", group = "layout"}),

  awful.key({ modkey, "Control" }, "n",
    function ()
      local c = awful.client.restore()
      -- Focus restored client
      if c then
        c:emit_signal(
          "request::activate", "key.unminimize", {raise = true}
        )
      end
    end,
    {description = "restore minimized", group = "client"}),

  awful.key({ modkey }, "x",
    function ()
      awful.prompt.run {
        prompt       = "Run Lua code: ",
        textbox      = awful.screen.focused().mypromptbox.widget,
        exe_callback = awful.util.eval,
        history_path = awful.util.get_cache_dir() .. "/history_eval"
      }
    end,
    {description = "lua execute prompt", group = "awesome"}),
  -- Menubar
  awful.key({ modkey }, "d", function() awful.spawn(apps.launcher) end,
    {description = "show the menubar", group = "launcher"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
  -- Hack to only show tags 1 and 9 in the shortcut window (mod+s)
  local descr_view, descr_toggle, descr_move, descr_toggle_focus
  if i == 1 or i == 9 then
    descr_view = {description = 'view tag #', group = 'tag'}
    descr_toggle = {description = 'toggle tag #', group = 'tag'}
    descr_move = {description = 'move focused client to tag #', group = 'tag'}
    descr_toggle_focus = {description = 'toggle focused client on tag #', group = 'tag'}
  end
  globalKeys =
    awful.util.table.join(
      globalKeys,
      -- View tag only.
      awful.key(
        {modkey},
        '#' .. i + 9,
        function()
          local screen = awful.screen.focused()
          local tag = screen.tags[i]
          if tag then
            tag:view_only()
          end
        end,
        descr_view
      ),
      -- Toggle tag display.
      awful.key(
        {modkey, 'Control'},
        '#' .. i + 9,
        function()
          local screen = awful.screen.focused()
          local tag = screen.tags[i]
          if tag then
            awful.tag.viewtoggle(tag)
          end
        end,
        descr_toggle
      ),
      -- TODO write "move to screen" key combinations
      -- Move client to tag.
      awful.key(
        {modkey, 'Shift'},
        '#' .. i + 9,
        function()
          if _G.client.focus then
            local tag = _G.client.focus.screen.tags[i]
            if tag then
              _G.client.focus:move_to_tag(tag)
            end
          end
        end,
        descr_move
      ),
      -- Toggle tag on focused client.
      awful.key(
        {modkey, 'Control', 'Shift'},
        '#' .. i + 9,
        function()
          if _G.client.focus then
            local tag = _G.client.focus.screen.tags[i]
            if tag then
              _G.client.focus:toggle_tag(tag)
            end
          end
        end,
        descr_toggle_focus
      )
    )
end

return globalKeys
