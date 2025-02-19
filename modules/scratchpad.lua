local bling = require("bling")

local get_geometry_by_host = function()

  local handle = io.popen("echo $HOSTNAME", "r")
  local result = handle:read("*l")
  handle:close()

  if result == "archpad" then
    return {x = 220, y = 180, height = 450, width = 1000}
  else
    return {x = 500, y = 180, height = 750, width = 1000}
  end
end

local term_scratch = bling.module.scratchpad({
  command = "st -n spterm",                                    -- How to spawn the scratchpad
  rule = { instance = "spterm" },                              -- The rule that the scratchpad will be searched by
  sticky = true,                                               -- Whether the scratchpad should be sticky
  autoclose = false,                                            -- Whether it should hide itself when losing focus
  floating = true,                                             -- Whether it should be floating (MUST BE TRUE FOR ANIMATIONS)
  geometry = get_geometry_by_host(), -- The geometry in a floating state
  reapply = true,                                              -- Whether all those properties should be reapplied on every new opening of the scratchpad (MUST BE TRUE FOR ANIMATIONS)
  dont_focus_before_close = false,                             -- When set to true, the scratchpad will be closed by the toggle function regardless of whether its focused or not. When set to false, the toggle function will first bring the scratchpad into focus and only close it on a second call
})

local calc_scratch = bling.module.scratchpad({
  command = "st -n spcalc -f monospace:size=16 -e bc -lq",    -- How to spawn the scratchpad
  rule = { instance = "spcalc" },                             -- The rule that the scratchpad will be searched by
  sticky = true,                                              -- Whether the scratchpad should be sticky
  autoclose = false,                                           -- Whether it should hide itself when losing focus
  floating = true,                                            -- Whether it should be floating (MUST BE TRUE FOR ANIMATIONS)
  geometry = get_geometry_by_host(), -- The geometry in a floating state
  reapply = true,                                             -- Whether all those properties should be reapplied on every new opening of the scratchpad (MUST BE TRUE FOR ANIMATIONS)
  dont_focus_before_close = false,                            -- When set to true, the scratchpad will be closed by the toggle function regardless of whether its focused or not. When set to false, the toggle function will first bring the scratchpad into focus and only close it on a second call
})

local scratchpads = {
  term_scratch = term_scratch,
  calc_scratch = calc_scratch,
}

return scratchpads
