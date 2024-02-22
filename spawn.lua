local start = tick()
local interval = 10
local duration = 60 -- 1 minute
local lastTime = 0

-- Assuming you have a creature model in ReplicatedStorage
local creatureTemplate = game.ReplicatedStorage:FindFirstChild("Pikachu")

-- Adjust this part to wait for a player to join and get their character
game.Players.PlayerAdded:Connect(function(player)
	local character = player.Character or player.CharacterAdded:Wait()

	while tick() - start < duration do
		if tick() - lastTime >= interval then
			-- Check if the creature template exists
			if creatureTemplate then
				local creature = creatureTemplate:Clone()
				creature.Parent = game.Workspace

				-- Spawn the creature near the player
				creature:SetPrimaryPartCFrame(character.PrimaryPart.CFrame * CFrame.new(5, 0, 5))

				print("Creature spawned")
			else
				print("Creature template not found")
			end

			lastTime = tick()
		end
		wait(1) -- yield
	end
end)
