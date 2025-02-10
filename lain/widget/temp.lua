--[[

     Licensed under GNU General Public License v2
      * (c) 2013, Luca CPZ

--]]

local helpers = require("lain.helpers")
local wibox = require("wibox")

-- {thermal,core} temperature info
-- lain.widget.temp

local function factory(args)
    args = args or {}

    local handle = io.popen("echo $HOSTNAME", "r")
    local result = handle:read("*l")
    handle:close()

    local temp_resource = "Tdie"
    if result == "archpad" then temp_resource = "CPU" end

    local temp = { widget = args.widget or wibox.widget.textbox() }
    local timeout = args.timeout or 30
    local settings = args.settings or function() end

    function temp.update()
        helpers.async_with_shell(
            "sensors 2>/dev/null | rg -s -n " .. temp_resource .. " | awk '{print $2}' | cut -c2- | head -c 2",
            function(f)
                temp_now = {}
                local temp_fl, temp_value
                for t in f:gmatch("[^\n]+") do
                    temp_fl = t
                    if temp_fl then
                        temp_value = temp_fl
                        coretemp_now = temp_value
                    else
                        coretemp_now = "N/A"
                    end
                end
                widget = temp.widget
                settings()
            end
        )
    end

    helpers.newtimer("thermal", timeout, temp.update)

    return temp
end

return factory
