local menubar = require("menubar")
local scratchpads = require("modules.scratchpad")
local awful = require("awful")
local dpi = require("beautiful.xresources").apply_dpi

-- small scripts
local change_language = function()
  local naughty = require("naughty")
  local handle = io.popen("setxkbmap -query | grep layout | cut -c13-")
  local result = handle:read("*a")
  handle:close()
  -- Trim the result to remove any trailing whitespace
  local result = result:gsub("^%s*(.-)%s*$", "%1")
  local lang = "us"
  if result == lang then
    os.execute("setxkbmap br")
    lang = "br"
  else
    os.execute("setxkbmap us")
  end
  naughty.notify({
    preset = naughty.config.presets.ok,
    message = "lang changed: " .. lang,
  })
end

local change_monitor_brightness = function(change)
  local naughty = require("naughty")
  -- Parse the sign and value from the change argument
  local sign = change:sub(1, 1)
  local val = change:sub(2)
  -- Get the current brightness value using ddcutil
  local ddcutil_command = "ddcutil getvcp 10 | awk '{print $9}' | tr ',' '\n' | head -1 | awk '{print $0}'"
  awful.spawn.easy_async_with_shell(ddcutil_command, function(stdout, _, _, _)
    local current_val = stdout
    local new_val = tonumber(current_val)
    if sign == "+" then
      new_val = new_val + tonumber(val)
    elseif sign == "-" then
      new_val = new_val - tonumber(val)
    end
    -- Ensure new_val is within the valid range (typically 0-100 for brightness)
    new_val = math.max(0, math.min(100, new_val))

    awful.spawn.easy_async_with_shell(string.format("ddcutil --display 1 setvcp 10 %d", new_val), function(out) end)
    awful.spawn.easy_async_with_shell(string.format("ddcutil --display 2 setvcp 10 %d", new_val), function(out) end)
    naughty.notify({
      preset = naughty.config.presets.ok,
      title = "Monitor Brightness",
      message = "Brightness changed from " .. current_val .. " to " .. new_val,
    })
  end)
  -- Calculate the new brightness value
  -- Set the new brightness value using ddcutil for each display
end

local toggle_bar_visibility = function()
  for s in screen do
    s.top_panel.visible = not s.top_panel.visible
    if s.top_panel.visible then
      s.top_panel.height = dpi(20)
    else
      s.top_panel.height = dpi(1)
    end
  end
end

-- small scripts

apps = {

  -- Your default terminal
  terminal = "st",

  -- Your default text editor
  editor = os.getenv("EDITOR") or "vim",

  -- editor_cmd = terminal .. " -e " .. editor,

  -- Your default file explorer
  explorer = "lfub",

  browser = "brave --password-store=basic",
  sysact = "sysact",
  btop = "btop",
  change_lang = change_language,
  password_manager = "rofi-pass",
  music_player = "ncmpcpp",
  torrent_client = "stig", -- transmission client
  remaps = "remaps",
  mounter = "mounter",
  unmounter = "unmounter",
  record_screen = "dmenurecord",
  emojipicker = "rofimoji --skin-tone neutral --action copy",
  launcher = "rofi -show drun -matching fuzzy",
  calculator = "rofi -show calc",
  stop_record_screen = "dmenurecord kill",
  screenshot = "maimpick",
  network_manager = "nmtui",
  mute_audio = "pamixer -t",
  volume_up = "pamixer --allow-boost -i 3",
  volume_down = "pamixer --allow-boost -d 3",
  brightness_down = change_monitor_brightness,
  brightness_up = change_monitor_brightness,
  toggle_bar_visibility = toggle_bar_visibility,
}

apps.editor_cmd = apps.terminal .. " -e " .. apps.editor
apps.explorer_cmd = apps.terminal .. " -e " .. apps.explorer
apps.network_manager_cmd = apps.terminal .. " -e " .. apps.network_manager
apps.btop_cmd = apps.terminal .. " -e " .. apps.btop
apps.music_player_cmd = apps.terminal .. " -e " .. apps.music_player
apps.music_player_toggle_cmd = "mpc toggle"
apps.music_player_next_cmd = "mpc next"
apps.music_player_previous_cmd = "mpc prev"
apps.torrent_client_cmd = apps.terminal .. " -e " .. apps.torrent_client
apps.scratchpad = scratchpads.term_scratch
menubar.utils.terminal = apps.terminal -- Set the terminal for applications that require it

return apps
