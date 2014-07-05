-- Framerate
-- This script is copied (by the Bin/SpeedHack file) to each user
-- It monitors their framerate and helps detect speed hacking

local framerate = Instance.new("NumberValue")
framerate.Parent = script
framerate.Name = "Current"

while true do
    wait()
    framerate.Value = 1/wait()
end
