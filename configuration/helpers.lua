local is_thinkpad_hostname = function()
  local handle = io.popen("echo $HOSTNAME", "r")
  local result = handle:read("*l")
  handle:close()
  return result == "archpad"
end

local helpers = {
  is_thinkpad_hostname = is_thinkpad_hostname
}

return helpers
