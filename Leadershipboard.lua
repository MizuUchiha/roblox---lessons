local Leadership = {}

local function setLeaderboard(player)
    local leaderstats = Instance.new("Folder")
    leaderstats.Name = "leaderstats"
    leaderstats.Parent = player
    return leaderstats
    
end

local function setStats(leaderstats, name, value)
    local stat = Instance.new("IntValue")
    stat.Name = name
    stat.Value = value
    stat.Parent = leaderstats
    return stat
end

function Leadership.setLeaderboard(player, key, value)
    local leaderstats = player:FindFirstChild("leaderstats")
    if not leaderstats then
      leaderstats = setLeaderboard(player)
    end

    local stat = leaderstats:FindFirstChild(key)
    if not stat then
        stat = setStats(leaderstats, key, 0)
    end
    stat.Value = value
    
end
return Leadership