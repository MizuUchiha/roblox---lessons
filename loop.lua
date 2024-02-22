-- every 10  seconds do something
local start = tick()
local interval = 10
local duration = 60 -- 1 minute
local lastTime = 0

local pikachu = game.ReplicatedStorage:FindFirstChild("Pikachu")

-- Wait for the plaver to join
game.Players.PlayerAdded:Connect(function(player)
    local character = player.Character or player.CharacterAdded:Wait()

    while tick() - start < duration do
        if tick() - lastTime >= interval then
            local cooridinates = character.PrimaryPart.CFrame
            local creature = pikachu:Clone()
            creature.Parent = game.Workspace
            creature:SetPrimaryPartCFrame(cooridinates * CFrame.new(5, 0, 5))
            --  your action
            print("10 seconds passed")
            lastTime = tick()
        end
        wait(1) -- yield
    end

end)
