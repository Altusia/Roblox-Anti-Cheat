-- Monitor
-- Watches everything and records malicious activities

local function NewWorkspaceDescendant(child)
    
end

local function NewChatMessage(player, message)
    
end

local function CreateHook(object)
    if object == "Workspace" then
        object.DescendantAdded:connect(NewWorkspaceDescendant)
        return true
    end
    
    if object:IsA("Player") then
        object.Chatted:connect(function(message)
            NewChatMessage(object, message)
        end)
    end
end

local function BeginHookService()
    for _,user in pairs(game.Players:GetChildren()) do
        CreateHook(user)
    end
    
    game.Players.PlayerAdded:connect(function(player)
        CreateHook(player)
    end)
end

CreateHook(Workspace)
BeginHookService()

-- Let's add a signal in the Pool
-- to inform the main script that we're online

local poolMessage = Instance.new("IntValue")
poolMessage.Name = "MonitorOnline"
poolMessage.Parent = script.Parent.Parent:FindFirstChild("Pool")