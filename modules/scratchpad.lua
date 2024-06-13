local bling = require("bling")

local term_scratch = bling.module.scratchpad({
  command = "st -n spterm", -- How to spawn the scratchpad
  rule = { instance = "spterm" }, -- The rule that the scratchpad will be searched by
  sticky = true, -- Whether the scratchpad should be sticky
  autoclose = true, -- Whether it should hide itself when losing focus
  floating = true, -- Whether it should be floating (MUST BE TRUE FOR ANIMATIONS)
  geometry = { x = 500, y = 180, height = 750, width = 1000 }, -- The geometry in a floating state
  reapply = true, -- Whether all those properties should be reapplied on every new opening of the scratchpad (MUST BE TRUE FOR ANIMATIONS)
  dont_focus_before_close = false, -- When set to true, the scratchpad will be closed by the toggle function regardless of whether its focused or not. When set to false, the toggle function will first bring the scratchpad into focus and only close it on a second call
})

local calc_scratch = bling.module.scratchpad({
  command = "st -n spcalc -f monospace:size=16 -e bc -lq", -- How to spawn the scratchpad
  rule = { instance = "spcalc" }, -- The rule that the scratchpad will be searched by
  sticky = true, -- Whether the scratchpad should be sticky
  autoclose = true, -- Whether it should hide itself when losing focus
  floating = true, -- Whether it should be floating (MUST BE TRUE FOR ANIMATIONS)
  geometry = { x = 530, y = 180, height = 750, width = 800 }, -- The geometry in a floating state
  reapply = true, -- Whether all those properties should be reapplied on every new opening of the scratchpad (MUST BE TRUE FOR ANIMATIONS)
  dont_focus_before_close = false, -- When set to true, the scratchpad will be closed by the toggle function regardless of whether its focused or not. When set to false, the toggle function will first bring the scratchpad into focus and only close it on a second call
})

local scratchpads = {
  term_scratch = term_scratch,
  calc_scratch = calc_scratch,
}

return scratchpads
