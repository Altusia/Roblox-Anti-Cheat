-- Points
-- Monitors the expenditure of player points to check for malicious transactions

local gamePublisher = game.CreatorId
local gameId = game.PlaceId

local function pointTransactionComplete(player, amount)
    if player == gamePublisher then
        return
    end
    
    
end

game:GetService("PointsService").PointsAwarded:connect(function(userId, pointsAwarded, userBalanceInGame, userTotalBalance)
    pointTransactionComplete(userId, pointsAwarded)
end)

-- Let's add a signal in the Pool
-- to inform the main script that we're online

local poolMessage = Instance.new("IntValue")
poolMessage.Name = "PointsOnline"
poolMessage.Parent = script.Parent.Parent:FindFirstChild("Pool")