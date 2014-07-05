-- Roblox Anti Cheat --
-- Open source project to stop exploits, hacks, cheats, and glitches --

local settings = {
    ["Debugging"] = true,
    ["Verbose"] = true
}

-- Configuration stops at this line --

local console = {}
console.writeln = (function(line)
    if not settings["Debugging"] then return end
    print("[RobloxAntiCheat] " .. tostring(line))
end)
console.error = (function(line)
    assert(false, tostring(line))
end)
console.verbose = (function(line)
    if not settings["Debugging"] then return end
    if not settings["Verbose"] then return end
    print("[RobloxAntiCheat][Verbose] " .. tostring(line))
end)

local function startup()
    script.Parent.Parent = game:service("ServerScriptService")
    console.verbose("Moved self to the ServerScriptService for protection")
    
    local launch = {
        "Monitor",
        "Points"
    }
    
    for _,launchName in pairs(launch) do
        if script.Parent.Bin:FindFirstChild(launchName) then
            console.verbose("Launching service: " .. launchName)
            
            script.Parent.Bin:FindFirstChild(launchName).Disabled = false
            
            local x = 0
            repeat wait() x=x+1 until script.Parent.Pool:FindFirstChild(launchName .. "Online") ~= nil or x > 15
            
            if x > 15 then
                console.error("Could not start, service timed out: " .. launchName)
                return
            end
            
            console.verbose(launchName .. " is now online!")
        else
            console.error("Could not start, missing service: " .. launchName)
            return
        end
    end
    
    local framerateMonitor = script.Parent.Storage.Framerate:Clone()
    framerateMonitor.Parent = game.StarterGui
    framerateMonitor.Disabled = false
    
    for _,user in pairs(game.Players:GetChildren()) do
        framerateMonitor:Clone().Parent = user:findFirstChild("PlayerGui")
    end
end

console.writeln("Starting...")
startup()
console.writeln("Now online and protecting this game!")