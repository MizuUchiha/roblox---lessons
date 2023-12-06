-- Script for spawning and controlling a character in Roblox

-- Settings
local spawnInterval = 180 -- Time in seconds between spawns
local spawnLocation = game.Workspace.SpawnLocation -- Replace with your actual spawn location

-- NPC Chase and Attack Script

local NPC = script.Parent -- The NPC should be the parent of this script
local players = game:GetService("Players")
local attackRange = 10 -- The range within which the NPC will attack players
local chaseRange = 50 -- The range within which the NPC will chase players
local attackDamage = 10 -- The damage dealt to the player on each attack
local attackSpeed = 1 -- Time in seconds between attacks

-- Function to get the nearest player within a certain range
local function getNearestPlayer(range)
    local nearestPlayer = nil
    local shortestDistance = range

    for _, player in pairs(players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (player.Character.HumanoidRootPart.Position - NPC.HumanoidRootPart.Position).magnitude
            if distance < shortestDistance then
                shortestDistance = distance
                nearestPlayer = player
            end
        end
    end

    return nearestPlayer
end

-- Main Loop
while wait(spawnInterval) do
    -- Clone the character model
    local character = game.ServerStorage.CharacterModel:Clone()
    character.Parent = game.Workspace

    -- Set the spawn location
    character:SetPrimaryPartCFrame(spawnLocation.CFrame)

    local targetPlayer = getNearestPlayer(chaseRange)

    if targetPlayer then
        local playerDistance = (targetPlayer.Character.HumanoidRootPart.Position - NPC.HumanoidRootPart.Position).magnitude

        -- Chase the player
        NPC.Humanoid:MoveTo(targetPlayer.Character.HumanoidRootPart.Position)

        -- Attack the player if in range
        if playerDistance <= attackRange then
            wait(attackSpeed) -- Wait for attack cooldown
            if targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") then
                targetPlayer.Character.Humanoid:TakeDamage(attackDamage)
            end
        end
    end
end

-- Display in console hello world