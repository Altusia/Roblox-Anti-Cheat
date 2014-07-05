-- SpeedHack
-- Monitors movement speed and checks for speed hacks

function waitForFramerateMonitor(player)
    local x = 0
    
    repeat wait() x=x+1 until (player:findFirstChild("PlayerGui") and player.PlayerGui:FindFirstChild("Framerate")) or x > 15
    if x > 15 then return false end
    return true
end

function doFramerateCheck(player)
    if not player:findFirstChild("PlayerGui") then waitForFramerateMonitor(player) end
    if not player.PlayerGui:findFirstChild("Framerate") then waitForFramerateMonitor(player) end
    if not player.PlayerGui:findFirstChild("Framerate") then return false end
    
    local framerate = player.PlayerGui.Framerate.Current.Value
    if framerate == 0 then return false end
    
    -- The default max framerate for the client is 30. 
    -- The 'framerate' variable can be heightened, however.
    -- This check should only kick the user for having an extreme outlier.
    
    if framerate > 120 then
        -- To-do: take action
    end
end

function doWalkspeedCheck(player)
    
end

while true do
    wait(1)
   
    for i,v in pairs(game.Players:GetChildren()) do
        ypcall(function() 
            doFramerateCheck(v)
            doWalkspeedCheck(v)
        end)
    end
end

-- Let's add a signal in the Pool
-- to inform the main script that we're online

local poolMessage = Instance.new("IntValue")
poolMessage.Name = "SpeedHackOnline"
poolMessage.Parent = script.Parent.Parent:FindFirstChild("Pool")